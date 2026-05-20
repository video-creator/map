#!/usr/bin/env ruby
# frozen_string_literal: true

#
# 将 libmdp.dylib 嵌入 Flutter macOS Runner Xcode 项目：
# 1. 添加 PBXFileReference
# 2. 注册到 Bundle Framework build phase（自动拷贝到 app bundle 的 Frameworks 目录）
# 3. 移除旧 Demo（gRPC server）的资源引用
#
# Usage:
#   cd mal_client
#   ruby embed_dylib.rb
#

require 'xcodeproj'

PROJECT_PATH = 'macos/Runner.xcodeproj'
DYLIB_PATH = 'Runner/libmdp.dylib'

project = Xcodeproj::Project.open(PROJECT_PATH)
runner_target = project.targets.find { |t| t.name == 'Runner' }
unless runner_target
  puts "ERROR: Runner target not found!"
  exit 1
end

puts "Found Runner target: #{runner_target.name}"

# ─── 1. 添加 libmdp.dylib 文件引用 ───
main_group = project.root_object.main_group
runner_group = main_group['Runner']
frameworks_group = main_group['Frameworks']

unless runner_group
  puts "ERROR: Runner group not found!"
  exit 1
end

# 检查是否已有 libmdp.dylib 引用
existing_ref = runner_group.files.find { |f| f.path == 'libmdp.dylib' } ||
               project.files.find { |f| f.path == 'libmdp.dylib' }

if existing_ref
  puts "libmdp.dylib reference already exists, removing..."
  existing_ref.remove_from_project
end

# 添加新的文件引用到 Runner 组
dylib_ref = runner_group.new_reference(DYLIB_PATH)
dylib_ref.name = 'libmdp.dylib'
dylib_ref.last_known_file_type = 'compiled.mach-o.dylib'
puts "Added file reference: libmdp.dylib"

# ─── 2. 注册到 Bundle Framework build phase ───
bundle_phase = runner_target.build_phases.find { |p|
  p.isa == 'PBXCopyFilesBuildPhase' && p.name == 'Bundle Framework'
}

unless bundle_phase
  puts "ERROR: Bundle Framework phase not found!"
  exit 1
end

# 先移除已有的 libmdp.dylib 条目（如果有）
bundle_phase.files.each do |bf|
  next unless bf.file_ref
  if bf.file_ref.path == 'libmdp.dylib' || (bf.file_ref.name == 'libmdp.dylib')
    puts "Removing existing libmdp.dylib from Bundle Framework phase..."
    bundle_phase.remove_build_file(bf)
  end
end

# 添加到 Bundle Framework phase（dstSubfolderSpec=10 = Frameworks）
build_file = bundle_phase.add_file_reference(dylib_ref)
puts "Added libmdp.dylib to Bundle Framework phase"

# ─── 3. 移除旧的 Demo 可执行文件（gRPC server）引用 ───
# 从 Resources 中移除
resources_phase = runner_target.resources_build_phase
old_demo_build_file = resources_phase.files.find { |bf|
  bf.file_ref && (bf.file_ref.path == 'Demo' || bf.file_ref.name == 'Demo')
}

if old_demo_build_file
  resources_phase.remove_build_file(old_demo_build_file)
  puts "Removed old Demo from Resources build phase"
else
  puts "No old Demo in Resources (already removed)"
end

# 从 Runner 组（已嵌入到 Resources 区域）中移除
old_demo_ref = runner_group.files.find { |f| f.path == 'Demo' }
if old_demo_ref
  old_demo_ref.remove_from_project
  puts "Removed old Demo file reference"
else
  puts "No old Demo file reference (already removed)"
end

# ─── 保存 ───
project.save

puts "\n=== Done! ==="
puts "libmdp.dylib will be bundled into mal_client.app/Contents/Frameworks/ on next build."
puts "To build: cd mal_client && flutter build macos"