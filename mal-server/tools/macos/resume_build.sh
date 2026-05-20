#!/bin/bash
#
# resume_build.sh — 从 [7/15] harfbuzz x86_64 恢复构建
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
TOOL_PREFIX="$ART/host_tools"

export PATH="$TOOL_PREFIX/bin:$PATH"
export SDKROOT="$SDK"

log()  { echo ""; echo "=== $1 ==="; }
sub()  { echo "  -> $1"; }

# ─── 编译 meson (单架构版，用于恢复构建) ───
build_meson_one() {
    local name="$1" srcdir="$2" arch="$3" pfx="$4" extra="${5:-}"
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
}

# ─── 编译 autotools (单架构版) ───
build_autotools_one() {
    local name="$1" srcdir="$2" arch="$3" pfx="$4" extra="${5:-}"
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
}

# ─── 编译 CMake (单架构版) ───
build_cmake_one() {
    local name="$1" srcdir="$2" arch="$3" pfx="$4" extra="${5:-}"
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
}

# ═══════════════════════════════════════════════
# [7/15] harfbuzz x86_64 (修复版: 禁用 glib)
# ═══════════════════════════════════════════════
log "[7/15] harfbuzz x86_64 (禁用 glib)"
build_meson_one harfbuzz "$SRC/harfbuzz" x86_64 "$X86_PREFIX" \
    "-Ddocs=disabled -Dtests=disabled -Dcairo=disabled -Dicu=disabled -Dfreetype=enabled -Dglib=disabled -Dgobject=disabled"

# ═══════════════════════════════════════════════
# [8/15] libunibreak
# ═══════════════════════════════════════════════
log "[8/15] libunibreak"
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

# ═══════════════════════════════════════════════
# [9/15] libass (depends on freetype, fribidi, harfbuzz)
# ═══════════════════════════════════════════════
log "[9/15] libass"
build_autotools_one libass "$SRC/libass" arm64 "$ARM_PREFIX" "--disable-require-system-font-provider --disable-fontconfig"
build_autotools_one libass "$SRC/libass" x86_64 "$X86_PREFIX" "--disable-require-system-font-provider --disable-fontconfig"

# ═══════════════════════════════════════════════
# [10/15] libwebp
# ═══════════════════════════════════════════════
log "[10/15] libwebp"
WEBP_EXTRA="-DWEBP_BUILD_ANIM_UTILS=OFF -DWEBP_BUILD_CWEBP=OFF -DWEBP_BUILD_DWEBP=OFF -DWEBP_BUILD_GIF2WEBP=OFF -DWEBP_BUILD_IMG2WEBP=OFF -DWEBP_BUILD_VWEBP=OFF -DWEBP_BUILD_WEBPINFO=OFF -DWEBP_BUILD_WEBPMUX=OFF -DWEBP_BUILD_EXTRAS=OFF"
build_cmake_one libwebp "$SRC/libwebp" arm64 "$ARM_PREFIX" "$WEBP_EXTRA"
build_cmake_one libwebp "$SRC/libwebp" x86_64 "$X86_PREFIX" "$WEBP_EXTRA"

# ═══════════════════════════════════════════════
# [11/15] libyuv
# ═══════════════════════════════════════════════
log "[11/15] libyuv"
build_cmake_one libyuv "$SRC/libyuv" arm64 "$ARM_PREFIX" "-DCMAKE_POSITION_INDEPENDENT_CODE=ON -DTEST=OFF"
build_cmake_one libyuv "$SRC/libyuv" x86_64 "$X86_PREFIX" "-DCMAKE_POSITION_INDEPENDENT_CODE=ON -DTEST=OFF"

# ═══════════════════════════════════════════════
# [12/15] protobuf
# ═══════════════════════════════════════════════
log "[12/15] protobuf"
PROTO_EXTRA="-Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_EXAMPLES=OFF -Dprotobuf_BUILD_PROTOBUF_BINARIES=ON -Dprotobuf_BUILD_LIBPROTOC=OFF -Dprotobuf_ABSL_PROVIDER=module -DCMAKE_POSITION_INDEPENDENT_CODE=ON -Dprotobuf_WITH_ZLIB=OFF"
build_cmake_one protobuf "$SRC/protobuf" arm64 "$ARM_PREFIX" "$PROTO_EXTRA"
build_cmake_one protobuf "$SRC/protobuf" x86_64 "$X86_PREFIX" "$PROTO_EXTRA"

# ═══════════════════════════════════════════════
# [13/15] SDL2
# ═══════════════════════════════════════════════
log "[13/15] SDL2"
build_cmake_one SDL2 "$SRC/SDL2" arm64 "$ARM_PREFIX" "-DSDL_STATIC=ON -DSDL_SHARED=OFF -DSDL_TEST=OFF -DSDL_EXAMPLES=OFF"
build_cmake_one SDL2 "$SRC/SDL2" x86_64 "$X86_PREFIX" "-DSDL_STATIC=ON -DSDL_SHARED=OFF -DSDL_TEST=OFF -DSDL_EXAMPLES=OFF"

# ═══════════════════════════════════════════════
# [14/15] FFmpeg
# ═══════════════════════════════════════════════
log "[14/15] FFmpeg"
FFMPEG_SRC="$TOOLS/FFmpeg_fork_mac"

for ARCH in arm64 x86_64; do
    if [ "$ARCH" = "arm64" ]; then PFX="$ARM_PREFIX"; else PFX="$X86_PREFIX"; fi
    BDIR="$ART/ffmpeg_${ARCH}"
    sub "[FFmpeg] 编译 $ARCH ..."
    rm -rf "$BDIR"
    mkdir -p "$BDIR"

    rsync -a "$FFMPEG_SRC/" "$BDIR/" 2>/dev/null || cp -R "$FFMPEG_SRC/" "$BDIR/" 2>/dev/null || true
    cd "$BDIR"

    export PKG_CONFIG_PATH="$PFX/lib/pkgconfig"

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
# [15/15] 合并 universal 库
# ═══════════════════════════════════════════════
log "[15/15] 合并 universal 库"
rm -rf "$UNI"
mkdir -p "$UNI/Libs/FFmpeg/lib" "$UNI/Libs/FFmpeg/include"

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
for PATTERN in libx264 libx265 libaom libfdk-aac libfreetype libfribidi libharfbuzz libass libwebp libyuv libprotobuf libSDL2 libpng16 libunibreak; do
    for F in "$ARM_PREFIX/lib"/${PATTERN}*.a; do
        [ -f "$F" ] || continue
        BASE=$(basename "$F")
        merge_lib "lib/$BASE"
    done
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
# 更新 Xcode 项目配置
# ═══════════════════════════════════════════════
log "更新 Xcode 项目配置"
PBX="$ROOT/Demo/Demo.xcodeproj/project.pbxproj"

sed -i '' 's/[[:space:]]*EXCLUDED_ARCHS = x86_64;//g' "$PBX"
sub "已删除 EXCLUDED_ARCHS"

sed -i '' 's|ffmpeg_arm64/Libs|universal/Libs|g' "$PBX"
sed -i '' 's|protoc_arm64|universal|g' "$PBX"
sed -i '' 's|libyuv_arm64|universal/Libs/other|g' "$PBX"
sed -i '' 's|"universal/Libs/other/lib"|"universal/Libs/other/lib","universal/Libs/FFmpeg/lib"|g' "$PBX"
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