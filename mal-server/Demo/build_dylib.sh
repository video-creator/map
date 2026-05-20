#!/bin/bash
#
# 构建 libmdp.dylib 并复制到 Flutter macOS Bundle 的 Frameworks 目录
#
# Usage:
#   ./build_dylib.sh                  # 构建 Debug
#   ./build_dylib.sh Release          # 构建 Release
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR"
CONFIGURATION="${1:-Debug}"

echo "=== Building libmdp.dylib (${CONFIGURATION}) ==="

# ─── 构建动态库 ───
xcodebuild -project "$PROJECT_DIR/Demo.xcodeproj" \
           -target libmdp \
           -configuration "$CONFIGURATION" \
           -arch arm64 -arch x86_64 \
           -quiet

DYLIB_PATH="$PROJECT_DIR/build/${CONFIGURATION}/libmdp.dylib"

if [ ! -f "$DYLIB_PATH" ]; then
  echo "ERROR: libmdp.dylib not found at $DYLIB_PATH"
  exit 1
fi

echo "  Produced: $DYLIB_PATH ($(ls -lh "$DYLIB_PATH" | awk '{print $5}'))"

# ─── 复制到 Flutter macOS Frameworks 目录 ───
FLUTTER_FRAMEWORKS_DIR="$PROJECT_DIR/../../mal_client/macos/Runner"
mkdir -p "$FLUTTER_FRAMEWORKS_DIR"

cp "$DYLIB_PATH" "$FLUTTER_FRAMEWORKS_DIR/"
echo "  Copied to: $FLUTTER_FRAMEWORKS_DIR/libmdp.dylib"

echo "=== Done ==="