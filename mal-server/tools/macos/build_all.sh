#!/bin/bash
#
# build_all.sh — 全自动从源码编译所有第三方依赖 + libmdp.dylib (Universal Binary)
#
# 依赖系统工具: cmake, meson, ninja, pkg-config, git, curl
# 安装: brew install cmake meson ninja pkg-config
#
# 使用:
#   cd mal-server/tools/macos && bash build_all.sh
#
# 输出:
#   src/third_party/mac/universal/   ← 所有 universal 依赖库
#   Demo/build/Debug/libmdp.dylib    ← universal dylib
#

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
TOOLS="$ROOT/tools/macos"
THIRD="$ROOT/src/third_party/mac"
UNI="$THIRD/universal"
SRC="$TOOLS/.build_sources"
ART="$TOOLS/.build_artifacts"

SDK=$(xcrun --sdk macosx --show-sdk-path)
VER="10.15"
JOBS=$(sysctl -n hw.ncpu)

ARM_PREFIX="$ART/staging_arm64"
X86_PREFIX="$ART/staging_x86_64"

# ─── 自编译工具目录（nasm 等） ───
TOOL_PREFIX="$ART/host_tools"

log()  { echo ""; echo "=== $1 ==="; }
sub()  { echo "  -> $1"; }

mkdir -p "$SRC" "$ART" "$ARM_PREFIX" "$X86_PREFIX" "$TOOL_PREFIX/bin"

# 把自编译工具加入 PATH 最前面
export PATH="$TOOL_PREFIX/bin:$PATH"

# 导出 SDK 路径，让裸 cc/clang 调用也能找到系统头文件（如 freetype apinames）
export SDKROOT="$SDK"

# ─── 下载 ───
dl() {
    local name="$1" url="$2" ref="${3:-}"
    [ -d "$SRC/$name" ] && { sub "[$name] 已存在"; return; }
    sub "[$name] 下载..."
    mkdir -p "$SRC/$name"
    cd "$SRC"
    case "$url" in
        *.git)
            if [ -n "$ref" ]; then
                # ref 可以是 tag 或 commit hash
                rm -rf "/tmp/${name}_clone"
                git init "/tmp/${name}_clone" 2>/dev/null
                cd "/tmp/${name}_clone"
                git remote add origin "$url"
                git fetch --depth 1 origin "$ref" 2>&1
                git checkout FETCH_HEAD 2>&1
                cd "$SRC"
            else
                git clone --depth 1 "$url" "/tmp/${name}_clone" 2>&1
            fi
            if [ -d "/tmp/${name}_clone" ]; then
                rm -rf "$SRC/$name"
                mv "/tmp/${name}_clone" "$SRC/$name"
            fi
            ;;
        *.tar.gz)
            curl -fsSL "$url" -o "/tmp/$name.tar.gz"
            tar xzf "/tmp/$name.tar.gz" -C "$SRC/$name" --strip-components=1 2>/dev/null || true
            rm -f "/tmp/$name.tar.gz" ;;
        *.tar.xz)
            curl -fsSL "$url" -o "/tmp/$name.tar.xz"
            tar xJf "/tmp/$name.tar.xz" -C "$SRC/$name" --strip-components=1 2>/dev/null || true
            rm -f "/tmp/$name.tar.xz" ;;
        *.bz2)
            curl -fsSL "$url" -o "/tmp/$name.tar.bz2"
            tar xjf "/tmp/$name.tar.bz2" -C "$SRC/$name" --strip-components=1 2>/dev/null || true
            rm -f "/tmp/$name.tar.bz2" ;;
    esac
    cd "$TOOLS"
    if [ -f "$SRC/$name/configure" ] || [ -f "$SRC/$name/CMakeLists.txt" ] || [ -f "$SRC/$name/meson.build" ] || [ -f "$SRC/$name/Makefile.in" ]; then
        sub "[$name] 下载完成"
    else
        sub "[$name] 下载完成(可能不完整)"
    fi
}

# ─── 编译 autotools (分别编译 arm64/x86_64) ───
build_autotools() {
    local name="$1" srcdir="$2" extra="${3:-}"

    for arch in arm64 x86_64; do
        local pfx
        [ "$arch" = "arm64" ] && pfx="$ARM_PREFIX" || pfx="$X86_PREFIX"
        local bdir="$ART/${name}_${arch}"
        sub "[$name] 编译 $arch ..."
        rm -rf "$bdir"
        mkdir -p "$bdir"
        cd "$bdir"

        export PKG_CONFIG_PATH="$pfx/lib/pkgconfig"

        CFLAGS="-arch $arch -isysroot $SDK -mmacosx-version-min=$VER -I$pfx/include" \
        CXXFLAGS="-arch $arch -isysroot $SDK -mmacosx-version-min=$VER -I$pfx/include" \
        LDFLAGS="-arch $arch -isysroot $SDK -L$pfx/lib" \
        CC="xcrun clang" CXX="xcrun clang++" \
        "$srcdir/configure" --host="${arch}-apple-darwin" --prefix="$pfx" $extra

        make -j$JOBS
        make install
        sub "[$name] $arch 完成"
    done
}

# ─── 编译 CMake ───
build_cmake() {
    local name="$1" srcdir="$2" extra="${3:-}"

    for arch in arm64 x86_64; do
        local pfx
        [ "$arch" = "arm64" ] && pfx="$ARM_PREFIX" || pfx="$X86_PREFIX"
        local bdir="$ART/${name}_${arch}"
        sub "[$name] 编译 $arch ..."
        rm -rf "$bdir"
        mkdir -p "$bdir"
        cd "$bdir"

        cmake "$srcdir" \
            -DCMAKE_OSX_ARCHITECTURES="$arch" \
            -DCMAKE_OSX_DEPLOYMENT_TARGET="$VER" \
            -DCMAKE_OSX_SYSROOT="$SDK" \
            -DCMAKE_INSTALL_PREFIX="$pfx" \
            -DCMAKE_PREFIX_PATH="$pfx" \
            -DBUILD_SHARED_LIBS=OFF \
            -DCMAKE_BUILD_TYPE=Release \
            $extra

        make -j$JOBS
        make install
        sub "[$name] $arch 完成"
    done
}

# ─── 编译 meson ───
build_meson() {
    local name="$1" srcdir="$2" extra="${3:-}"

    for arch in arm64 x86_64; do
        local pfx
        [ "$arch" = "arm64" ] && pfx="$ARM_PREFIX" || pfx="$X86_PREFIX"
        local bdir="$ART/${name}_${arch}"
        sub "[$name] 编译 $arch ..."
        rm -rf "$bdir"
        mkdir -p "$bdir"
        cd "$bdir"

        PKG_CONFIG_PATH="$pfx/lib/pkgconfig" \
        meson setup "$srcdir" \
            --prefix="$pfx" --libdir=lib \
            --default-library=static -Dbuildtype=release \
            -Dc_args="-arch $arch -isysroot $SDK -mmacosx-version-min=$VER" \
            -Dc_link_args="-arch $arch -isysroot $SDK" \
            -Dcpp_args="-arch $arch -isysroot $SDK -mmacosx-version-min=$VER" \
            -Dcpp_link_args="-arch $arch -isysroot $SDK" \
            $extra

        ninja -j$JOBS
        meson install
        sub "[$name] $arch 完成"
    done
}

# ─── 检查系统工具 ───
log "检查系统工具"
for cmd in cmake meson ninja clang clang++ git curl make pkg-config; do
    command -v $cmd >/dev/null && sub "✓ $cmd" || { echo "缺少 $cmd"; exit 1; }
done

# ═══════════════════════════════════════════════
# Step 0: 编译 nasm (host only, 不需要 universal)
# ═══════════════════════════════════════════════

log "[0/15] nasm (assembler)"
NASM_VER="2.16.03"
if command -v nasm >/dev/null 2>&1; then
    # 检查已有的 nasm 版本
    EXISTING_VER=$(nasm --version 2>/dev/null | head -1 | awk '{print $3}')
fi
# 只在没有 nasm 或者版本太旧时重新编译
if ! command -v nasm >/dev/null 2>&1 || [ "$(nasm --version 2>/dev/null | head -1 | awk '{print $3}' | cut -d. -f1)" -lt 2 ] || [ "$(nasm --version 2>/dev/null | head -1 | awk '{print $3}' | cut -d. -f2)" -lt 15 ]; then
    NASM_URL="https://www.nasm.us/pub/nasm/releasebuilds/${NASM_VER}/nasm-${NASM_VER}.tar.gz"
    NASM_DIR="$SRC/nasm"
    if [ ! -d "$NASM_DIR" ]; then
        dl nasm "$NASM_URL"
    fi
    sub "[nasm] 编译 (host only)..."
    NASM_BDIR="$ART/nasm_host"
    rm -rf "$NASM_BDIR"
    mkdir -p "$NASM_BDIR"
    cd "$NASM_BDIR"
    CC="cc" "$NASM_DIR/configure" --prefix="$TOOL_PREFIX"
    make -j$JOBS
    make install
    sub "[nasm] 完成: $(nasm --version 2>/dev/null | head -1)"
else
    sub "[nasm] 已满足要求: $(nasm --version 2>/dev/null | head -1)"
fi

# ═══════════════════════════════════════════════
# 开始逐个编译
# ═══════════════════════════════════════════════

log "[1/15] x264"
dl x264 "https://code.videolan.org/videolan/x264.git"
build_autotools x264 "$SRC/x264" "--enable-static --disable-cli --disable-opencl --disable-lavf --disable-swscale"

log "[2/15] x265"
dl x265 "https://bitbucket.org/multicoreware/x265_git.git"
build_cmake x265 "$SRC/x265/source" "-DENABLE_SHARED=OFF -DENABLE_CLI=OFF -DEXPORT_C_API=ON"

log "[3/15] aom (AV1)"
dl aom "https://aomedia.googlesource.com/aom.git"
AOM_BASE="-DENABLE_EXAMPLES=OFF -DENABLE_TESTS=OFF -DENABLE_TOOLS=OFF -DCONFIG_AV1_ENCODER=1 -DCONFIG_AV1_DECODER=1 -DCONFIG_RUNTIME_CPU_DETECT=0"
for ARCH in arm64 x86_64; do
    if [ "$ARCH" = "arm64" ]; then
        PFX="$ARM_PREFIX"
        EXTRA="$AOM_BASE"
    else
        PFX="$X86_PREFIX"
        EXTRA="$AOM_BASE -DAOM_TARGET_CPU=x86_64"
    fi
    BDIR="$ART/aom_${ARCH}"
    sub "[aom] 编译 $ARCH ..."
    rm -rf "$BDIR"
    mkdir -p "$BDIR"
    cd "$BDIR"
    cmake "$SRC/aom" \
        -DCMAKE_OSX_ARCHITECTURES="$ARCH" \
        -DCMAKE_OSX_DEPLOYMENT_TARGET="$VER" \
        -DCMAKE_OSX_SYSROOT="$SDK" \
        -DCMAKE_INSTALL_PREFIX="$PFX" \
        -DCMAKE_PREFIX_PATH="$PFX" \
        -DBUILD_SHARED_LIBS=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        $EXTRA
    make -j$JOBS
    make install
    sub "[aom] $ARCH 完成"
done

log "[4/15] fdk-aac"
dl fdk-aac "https://sourceforge.net/projects/opencore-amr/files/fdk-aac/fdk-aac-2.0.3.tar.gz"
build_autotools fdk-aac "$SRC/fdk-aac"

log "[5/15] freetype"
dl freetype "https://download.savannah.gnu.org/releases/freetype/freetype-2.13.3.tar.gz"
build_autotools freetype "$SRC/freetype" "--with-brotli=no --with-bzip2=no --with-png=no --with-harfbuzz=no --with-zlib=no"

log "[6/15] fribidi"
dl fribidi "https://github.com/fribidi/fribidi.git"
build_meson fribidi "$SRC/fribidi" "-Ddocs=false -Dtests=false"

log "[7/15] harfbuzz (depends on freetype)"
dl harfbuzz "https://github.com/harfbuzz/harfbuzz.git"
build_meson harfbuzz "$SRC/harfbuzz" "-Ddocs=disabled -Dtests=disabled -Dcairo=disabled -Dicu=disabled -Dfreetype=enabled -Dglib=disabled -Dgobject=disabled"

log "[8/15] libunibreak"
dl libunibreak "https://github.com/adah1972/libunibreak.git"
for ARCH in arm64 x86_64; do
    if [ "$ARCH" = "arm64" ]; then PFX="$ARM_PREFIX"; else PFX="$X86_PREFIX"; fi
    BDIR="$ART/libunibreak_${ARCH}"
    sub "[libunibreak] 编译 $ARCH ..."
    rm -rf "$BDIR"
    mkdir -p "$BDIR"
    cp -r "$SRC/libunibreak/"* "$BDIR/"
    cd "$BDIR"
    CFLAGS="-arch $ARCH -isysroot $SDK -mmacosx-version-min=$VER -fPIC" CC="$(xcrun -f clang)" \
        make -j$JOBS 2>/dev/null || true
    F=$(find "$BDIR" -name "*.a" 2>/dev/null | head -1)
    if [ -n "$F" ]; then
        mkdir -p "$PFX/lib" "$PFX/include"
        cp "$F" "$PFX/lib/"
        cp src/*.h "$PFX/include/" 2>/dev/null || true
    fi
    sub "[libunibreak] $ARCH 完成"
done

log "[9/15] libass (depends on freetype, fribidi, harfbuzz)"
dl libass "https://github.com/libass/libass.git"
build_meson libass "$SRC/libass" "-Dtest=disabled -Dprofile=disabled -Dcheckasm=disabled -Dasm=disabled"

log "[10/15] libwebp"
dl libwebp "https://github.com/webmproject/libwebp.git"
build_cmake libwebp "$SRC/libwebp" \
    "-DWEBP_BUILD_ANIM_UTILS=OFF -DWEBP_BUILD_CWEBP=OFF -DWEBP_BUILD_DWEBP=OFF -DWEBP_BUILD_GIF2WEBP=OFF -DWEBP_BUILD_IMG2WEBP=OFF -DWEBP_BUILD_VWEBP=OFF -DWEBP_BUILD_WEBPINFO=OFF -DWEBP_BUILD_WEBPMUX=OFF -DWEBP_BUILD_EXTRAS=OFF"

log "[11/15] libyuv"
dl libyuv "https://chromium.googlesource.com/libyuv/libyuv.git"

for arch in arm64 x86_64; do
    pfx=""; [ "$arch" = "arm64" ] && pfx="$ARM_PREFIX" || pfx="$X86_PREFIX"
    bdir="$ART/libyuv_${arch}"
    sub "[libyuv] 编译 $arch ..."
    rm -rf "$bdir"
    mkdir -p "$bdir"
    cd "$bdir"

    cmake "$SRC/libyuv" \
        -DCMAKE_OSX_ARCHITECTURES="$arch" \
        -DCMAKE_OSX_DEPLOYMENT_TARGET="$VER" \
        -DCMAKE_OSX_SYSROOT="$SDK" \
        -DCMAKE_INSTALL_PREFIX="$pfx" \
        -DCMAKE_PREFIX_PATH="$pfx" \
        -DBUILD_SHARED_LIBS=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DTEST=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.5

    # 只构建静态库（libyuv 的 CMakeLists.txt 强制创建共享库，但静态链接 jpeg 失败）
    make yuv -j$JOBS
    mkdir -p "$pfx/lib"
    cp "$bdir/libyuv.a" "$pfx/lib/"
    cp -r "$SRC/libyuv/include/"* "$pfx/include/" 2>/dev/null || true
    sub "[libyuv] $arch 完成"
done

log "[12/15] protobuf"
dl protobuf "https://github.com/protocolbuffers/protobuf.git" "6221a32e9b4316dfa2501209c2e5ba2649ffe956"
build_cmake protobuf "$SRC/protobuf" \
    "-Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_EXAMPLES=OFF -Dprotobuf_BUILD_PROTOBUF_BINARIES=ON -Dprotobuf_BUILD_LIBPROTOC=ON -Dprotobuf_ABSL_PROVIDER=module -DCMAKE_POSITION_INDEPENDENT_CODE=ON -Dprotobuf_WITH_ZLIB=OFF"

log "[13/15] SDL2"
dl SDL2 "https://github.com/libsdl-org/SDL.git"
build_cmake SDL2 "$SRC/SDL2" "-DSDL_STATIC=ON -DSDL_SHARED=OFF -DSDL_TEST=OFF -DSDL_EXAMPLES=OFF"

# ─── FFmpeg ───
log "[14/15] FFmpeg"
FFMPEG_SRC="$TOOLS/FFmpeg_fork_mac"

for ARCH in arm64 x86_64; do
    if [ "$ARCH" = "arm64" ]; then PFX="$ARM_PREFIX"; else PFX="$X86_PREFIX"; fi
    BDIR="$ART/ffmpeg_${ARCH}"
    sub "[FFmpeg] 编译 $ARCH ..."
    rm -rf "$BDIR"
    mkdir -p "$BDIR"

    # 复制源码到构建目录
    rsync -a "$FFMPEG_SRC/" "$BDIR/" 2>/dev/null || cp -R "$FFMPEG_SRC/" "$BDIR/" 2>/dev/null || true
    cd "$BDIR"

    export PKG_CONFIG_PATH="$PFX/lib/pkgconfig"

    # 先 make clean 避免残留
    make clean 2>/dev/null || true
    make distclean 2>/dev/null || true

    CFLAGS="-arch $ARCH -isysroot $SDK -mmacosx-version-min=$VER -I$PFX/include" \
    CXXFLAGS="-arch $ARCH -isysroot $SDK -mmacosx-version-min=$VER -I$PFX/include" \
    LDFLAGS="-arch $ARCH -isysroot $SDK -L$PFX/lib" \
    CC="$(xcrun -f clang)" CXX="$(xcrun -f clang++)" \
    ./configure \
        --prefix="$PFX" \
        --enable-debug --disable-optimizations \
        --enable-libx264 --enable-libx265 \
        --enable-gpl --enable-nonfree \
        --enable-libfdk-aac --enable-libwebp \
        --enable-libfreetype --enable-filter=drawtext \
        --enable-libharfbuzz --enable-libaom \
        --enable-libass \
        --enable-demuxer=webp \
        --extra-ldflags="-lstdc++ -L$PFX/lib" \
        --extra-cflags="-I$PFX/include" \
        --enable-encoder=libaom_av1 \
        --disable-shared --enable-static \
        --disable-ffplay --disable-ffprobe --disable-doc

    make -j$JOBS
    make install
    sub "[FFmpeg] $ARCH 完成"
done

# ═══════════════════════════════════════════════
# 合并 universal 库
# ═══════════════════════════════════════════════

log "[15/15] 合并 universal 库"
rm -rf "$UNI"
mkdir -p "$UNI/Libs/FFmpeg/lib" "$UNI/Libs/FFmpeg/include"

# 合并所有 .a
merge_lib() {
    local libpath="$1"
    local arm="$ARM_PREFIX/$libpath"
    local x86="$X86_PREFIX/$libpath"
    local out="$UNI/$libpath"
    mkdir -p "$(dirname "$out")"

    if [ -f "$arm" ] && [ -f "$x86" ]; then
        lipo -create "$arm" "$x86" -output "$out"
        sub "universal: $libpath"
    elif [ -f "$arm" ]; then
        cp "$arm" "$out"
        sub "arm64-only: $libpath"
    fi
}

# FFmpeg libs
for LIB in libavcodec.a libavdevice.a libavfilter.a libavformat.a libavutil.a libswresample.a libswscale.a libpostproc.a; do
    merge_lib "lib/$LIB"
done

# Other libs
for PATTERN in libx264 libx265 libaom libfdk-aac libfreetype libfribidi libharfbuzz libass libwebp libyuv libprotobuf libprotoc libSDL2 libpng16 libunibreak; do
    for F in "$ARM_PREFIX/lib"/${PATTERN}*.a; do
        [ -f "$F" ] || continue
        BASE=$(basename "$F")
        merge_lib "lib/$BASE"
    done
done

# absl 库 (protobuf 依赖, 88 个独立库)
mkdir -p "$UNI/Libs/absl/lib"
for F in "$ARM_PREFIX/lib"/libabsl_*.a; do
    BASE=$(basename "$F")
    X86_F="$X86_PREFIX/lib/$BASE"
    if [ -f "$X86_F" ]; then
        lipo -create "$F" "$X86_F" -output "$UNI/Libs/absl/lib/$BASE"
        sub "universal: Libs/absl/lib/$BASE"
    else
        cp "$F" "$UNI/Libs/absl/lib/$BASE"
        sub "arm64-only: Libs/absl/lib/$BASE"
    fi
done

# 移动 FFmpeg 库到 Libs/FFmpeg/lib/
for f in "$UNI"/lib/libav*.a "$UNI"/lib/libsw*.a "$UNI"/lib/libpostproc.a; do
    [ -f "$f" ] && mv "$f" "$UNI/Libs/FFmpeg/lib/"
done

# 复制 FFmpeg include
cp -r "$ARM_PREFIX/include"/* "$UNI/Libs/FFmpeg/include/" 2>/dev/null || true

# 组织其他库
mkdir -p "$UNI/Libs/other/lib"
for f in "$UNI"/lib/*.a; do
    [ -f "$f" ] && mv "$f" "$UNI/Libs/other/lib/"
done

# 复制其他 include
if [ -d "$ARM_PREFIX/include" ]; then
    cp -r "$ARM_PREFIX/include"/* "$UNI/include/" 2>/dev/null || true
fi

sub "universal 库目录: $UNI"
find "$UNI" -name "*.a" | while read f; do
    sub "$(lipo -info "$f" 2>/dev/null): $(basename "$f")"
done

# ═══════════════════════════════════════════════
# 更新 Xcode project.pbxproj
# ═══════════════════════════════════════════════

log "更新 Xcode 项目配置"
PBX="$ROOT/Demo/Demo.xcodeproj/project.pbxproj"

# 删除所有 EXCLUDED_ARCHS
sed -i '' 's/[[:space:]]*EXCLUDED_ARCHS = x86_64;//g' "$PBX"
sub "已删除 EXCLUDED_ARCHS"

# 替换路径
sed -i '' 's|ffmpeg_arm64/Libs|universal/Libs|g' "$PBX"
sed -i '' 's|protoc_arm64|universal|g' "$PBX"
sed -i '' 's|libyuv_arm64|universal/Libs/other|g' "$PBX"
# 修正 protobuf 库搜索路径（sed 替换后 protoc_arm64→universal，但库在 Libs/other 下）
sed -i '' 's|universal/lib"|universal/Libs/other/lib"|g' "$PBX"
sub "已更新搜索路径"

# ═══════════════════════════════════════════════
# 构建 universal dylib
# ═══════════════════════════════════════════════

log "构建 universal libmdp.dylib"
cd "$ROOT/Demo"
xcodebuild -project Demo.xcodeproj -target libmdp -configuration Debug -arch arm64 -arch x86_64

DYLIB="$ROOT/Demo/build/Debug/libmdp.dylib"
if [ -f "$DYLIB" ]; then
    file "$DYLIB"
    lipo -info "$DYLIB"
    # 复制到 Flutter
    mkdir -p "$ROOT/../../mal_client/macos/Runner"
    cp "$DYLIB" "$ROOT/../../mal_client/macos/Runner/"
    sub "已复制到 Flutter 项目"
fi

echo ""
echo "=============================================="
echo "  编译完成!"
echo "  universal dylib: $DYLIB"
echo "  lipo info: $(lipo -info "$DYLIB" 2>/dev/null)"
echo "=============================================="