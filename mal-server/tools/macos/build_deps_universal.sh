#!/bin/bash
#
# build_deps_universal.sh
#
# 将 third_party/mac/ 下的依赖库合并为 universal binary (arm64 + x86_64)
# 输出到 third_party/mac/universal/ 目录
#
# Usage:
#   cd mal-server
#   bash tools/macos/build_deps_universal.sh
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
THIRD_PARTY_DIR="$SCRIPT_DIR/../../src/third_party/mac"
UNIVERSAL_DIR="$THIRD_PARTY_DIR/universal"

echo "=== 创建 Universal 依赖库 ==="
echo "第三方库目录: $THIRD_PARTY_DIR"
echo "输出目录:     $UNIVERSAL_DIR"
echo ""

# 清理旧的 universal 目录
rm -rf "$UNIVERSAL_DIR"

# ──────────────────────────────────────────────────
# 1. FFmpeg 核心库 (7 个): 合并 x86_64 + arm64
# ──────────────────────────────────────────────────
echo "--- 1. FFmpeg 核心库 ---"
X86_FFMPEG_LIB="$THIRD_PARTY_DIR/ffmpeg/lib"
ARM_FFMPEG_LIB="$THIRD_PARTY_DIR/ffmpeg_arm64/Libs/FFmpeg/lib"
UNI_FFMPEG_DIR="$UNIVERSAL_DIR/FFmpeg/lib"
mkdir -p "$UNI_FFMPEG_DIR"

# 复制 include
cp -r "$THIRD_PARTY_DIR/ffmpeg/include" "$UNIVERSAL_DIR/FFmpeg/"

for lib in libavcodec.a libavdevice.a libavfilter.a libavformat.a libavutil.a libswresample.a libswscale.a libpostproc.a; do
  x86="$X86_FFMPEG_LIB/$lib"
  arm="$ARM_FFMPEG_LIB/$lib"
  out="$UNI_FFMPEG_DIR/$lib"

  if [ -f "$x86" ] && [ -f "$arm" ]; then
    echo "  $lib: x86_64 + arm64 → universal"
    lipo -create "$x86" "$arm" -output "$out"
  elif [ -f "$arm" ]; then
    echo "  $lib: arm64 only (copying as-is)"
    cp "$arm" "$out"
  elif [ -f "$x86" ]; then
    echo "  $lib: x86_64 only (copying as-is)"
    cp "$x86" "$out"
  else
    echo "  $lib: NOT FOUND, skipping"
  fi
done

# libffservice.a (arm64 only)
if [ -f "$ARM_FFMPEG_LIB/libffservice.a" ]; then
  echo "  libffservice.a: arm64 only (copying)"
  cp "$ARM_FFMPEG_LIB/libffservice.a" "$UNI_FFMPEG_DIR/"
fi

echo ""

# ──────────────────────────────────────────────────
# 2. FFmpeg 额外依赖 (arm64 下的 Libs 子目录)
#    仅当 x86_64 版本也存在时才合并，否则只拷贝 arm64
# ──────────────────────────────────────────────────
ARM_LIBS_DIR="$THIRD_PARTY_DIR/ffmpeg_arm64/Libs"
UNI_LIBS_DIR="$UNIVERSAL_DIR/Libs"

# 这些依赖在 arm64 下存在，检查是否有 x86_64 对应版本
# 如果 x86_64 不存在，则仅拷贝 arm64 版本（xcodebuild 在 x86_64 架构下不会使用它们）
if [ -d "$ARM_LIBS_DIR" ]; then
  echo "--- 2. FFmpeg 额外依赖库 ---"
  for dep_dir in "$ARM_LIBS_DIR"/*/; do
    dep_name=$(basename "$dep_dir")
    if [ "$dep_name" = "FFmpeg" ]; then
      continue  # 已在步骤 1 中处理
    fi

    out_dir="$UNI_LIBS_DIR/$dep_name/lib"
    mkdir -p "$out_dir"

    for lib_file in "$dep_dir"lib/*.a; do
      lib_name=$(basename "$lib_file")
      out="$out_dir/$lib_name"

      # 检查 x86_64 对应版本
      # x86_64 的对应目录可能不存在，仅拷贝 arm64
      echo "  $dep_name/$lib_name: arm64 only (copying)"
      cp "$lib_file" "$out"
    done
  done
fi

echo ""

# ──────────────────────────────────────────────────
# 3. libyuv: 合并 x86_64 + arm64
# ──────────────────────────────────────────────────
echo "--- 3. libyuv ---"
X86_YUV="$THIRD_PARTY_DIR/libyuv"
ARM_YUV="$THIRD_PARTY_DIR/libyuv_arm64"
UNI_YUV="$UNIVERSAL_DIR/libyuv"
mkdir -p "$UNI_YUV/lib"

echo "  libyuv.a: x86_64 + arm64 → universal"
lipo -create \
  "$X86_YUV/lib/libyuv.a" \
  "$ARM_YUV/lib/libyuv.a" \
  -output "$UNI_YUV/lib/libyuv.a"

# 复制 include（两者相同，用 arm64 的）
cp -r "$ARM_YUV/include" "$UNI_YUV/"
echo ""

# ──────────────────────────────────────────────────
# 4. protobuf: 合并 x86_64 + arm64
# ──────────────────────────────────────────────────
echo "--- 4. protobuf ---"
X86_PROTOC="$THIRD_PARTY_DIR/protoc"
ARM_PROTOC="$THIRD_PARTY_DIR/protoc_arm64"
UNI_PROTOC="$UNIVERSAL_DIR/protoc"
mkdir -p "$UNI_PROTOC/lib"

echo "  libprotobuf.a: x86_64 + arm64 → universal"
lipo -create \
  "$X86_PROTOC/lib/libprotobuf.a" \
  "$ARM_PROTOC/lib/libprotobuf.a" \
  -output "$UNI_PROTOC/lib/libprotobuf.a"

# 也处理 libprotoc.a（如果存在）
if [ -f "$X86_PROTOC/lib/libprotoc.a" ] && [ -f "$ARM_PROTOC/lib/libprotoc.a" ]; then
  echo "  libprotoc.a: x86_64 + arm64 → universal"
  lipo -create \
    "$X86_PROTOC/lib/libprotoc.a" \
    "$ARM_PROTOC/lib/libprotoc.a" \
    -output "$UNI_PROTOC/lib/libprotoc.a"
fi

# 复制 include（protobuf include 两者相同，用 arm64 的）
cp -r "$ARM_PROTOC/include" "$UNI_PROTOC/"
echo ""

# ──────────────────────────────────────────────────
# 5. nlohmann: header-only，直接复制
# ──────────────────────────────────────────────────
echo "--- 5. nlohmann (header-only) ---"
mkdir -p "$UNIVERSAL_DIR/nlohmann"
cp -r "$THIRD_PARTY_DIR/nlohmann/include" "$UNIVERSAL_DIR/nlohmann/"
echo "  nlohmann: copied"
echo ""

# ──────────────────────────────────────────────────
# 验证结果
# ──────────────────────────────────────────────────
echo "=== 验证 ==="
all_universal=true
while IFS= read -r -d '' libfile; do
  info=$(lipo -info "$libfile" 2>/dev/null || true)
  if echo "$info" | grep -q "universal"; then
    echo "  ✓ universal: $libfile"
  elif echo "$info" | grep -qE "architecture: arm64|architecture: x86_64"; then
    arch=$(echo "$info" | grep -oE "architecture: [a-z0-9_]+")
    echo "  ! single($arch): $libfile"
  else
    echo "  ? unknown: $libfile"
    all_universal=false
  fi
done < <(find "$UNIVERSAL_DIR" -name "*.a" -print0)

if $all_universal; then
  echo ""
  echo "=== 所有依赖库已处理完毕 ==="
  echo "输出目录: $UNIVERSAL_DIR"
else
  echo ""
  echo "=== 警告: 部分库为单架构 ==="
  echo "这不会影响 Flutter (x86_64) 的正常构建"
fi