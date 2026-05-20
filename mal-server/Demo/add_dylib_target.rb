#!/usr/bin/env ruby
# frozen_string_literal: true

#
# 新增 libmdp 动态库 target 到 Demo.xcodeproj
# 保留 Demo 可执行文件 target 不变
#
# Usage:
#   cd mal-server/Demo
#   ruby add_dylib_target.rb
#

require 'xcodeproj'
require 'fileutils'

project_path = 'Demo.xcodeproj'
project = Xcodeproj::Project.open(project_path)

# ─── 找到 Demo target ───
demo_target = project.targets.find { |t| t.name == 'Demo' }
unless demo_target
  puts "ERROR: Demo target not found!"
  exit 1
end

puts "Found Demo target: UUID=#{demo_target.uuid}"

# ─── 检查是否已经存在 libmdp target，先删除重建 ───
existing = project.targets.find { |t| t.name == 'libmdp' }
if existing
  puts "libmdp target already exists, removing it first..."
  project.targets.delete(existing)
  # 删除产品引用
  project.products.delete_if { |p| p.path == 'libmdp.dylib' }
end

# ─── 创建动态库 target ───
lib_target = project.new_target(
  :dynamic_library,
  'libmdp',
  :osx,
  '10.15',
  nil,
  :swift
)

# ─── 设置产品引用路径 ───
lib_target.product_name = 'libmdp'
lib_product = project.products.find { |p| p.path == 'libmdp.dylib' }
lib_product.name = 'libmdp.dylib' if lib_product

puts "Created libmdp target: UUID=#{lib_target.uuid}"

# ─── 排除的文件（可执行文件入口）───
EXCLUDED_SOURCES = ['main.cpp', 'Test.cpp']

# ─── 复制源码文件 ───
demo_target.source_build_phase.files.each do |bf|
  next unless bf.file_ref
  fr = bf.file_ref
  # 处理文件引用可能嵌套的 group
  file_name = fr.name || fr.path || File.basename(fr.real_path.to_s)
  file_path = fr.path || ''

  if EXCLUDED_SOURCES.include?(file_name)
    puts "  [skip source] #{file_name}"
    next
  end

  lib_target.source_build_phase.add_file_reference(fr)
  puts "  [source] #{file_name}"
end

# ─── 复制 framework/library 依赖 ───
demo_target.frameworks_build_phase.files.each do |bf|
  next unless bf.file_ref
  fr = bf.file_ref
  name = fr.name || fr.path || File.basename(fr.real_path.to_s)
  lib_target.frameworks_build_phase.add_file_reference(fr)
  puts "  [framework] #{name}"
end

# ─── 复制资源文件 ───
demo_target.resources_build_phase.files.each do |bf|
  next unless bf.file_ref
  fr = bf.file_ref
  name = fr.name || fr.path || File.basename(fr.real_path.to_s)
  lib_target.resources_build_phase.add_file_reference(fr)
  puts "  [resource] #{name}"
end

# ─── 复制依赖（target dependencies）───
demo_target.dependencies.each do |dep|
  lib_target.add_dependency(dep.target)
end

# ─── 复制构建配置 ───
demo_target.build_configurations.each do |demo_config|
  lib_config = lib_target.build_configurations.find { |c| c.name == demo_config.name }
  next unless lib_config

  # 复制所有构建设置
  demo_config.build_settings.each do |key, value|
    next if key == 'PRODUCT_NAME' || key == 'MACH_O_TYPE'
    lib_config.build_settings[key] = value
  end

  # 动态库特有的设置
  lib_config.build_settings['MACH_O_TYPE'] = 'mh_dylib'
  lib_config.build_settings['PRODUCT_NAME'] = 'libmdp'
  lib_config.build_settings['EXECUTABLE_PREFIX'] = ''
  lib_config.build_settings['DYLIB_INSTALL_NAME_BASE'] = '@rpath'
  lib_config.build_settings['INSTALL_PATH'] = '@rpath'
  lib_config.build_settings['SKIP_INSTALL'] = 'YES'

  # 移除可执行文件特有的设置
  lib_config.build_settings.delete('INFOPLIST_FILE')
  lib_config.build_settings.delete('GENERATE_INFOPLIST_FILE')

  puts "  [config] #{demo_config.name} -> libmdp"
end

# ─── 保存 ───
project.save

puts "\n=== Done! ==="
puts "New target 'libmdp' (dynamic library) created."
puts "Build: xcodebuild -project Demo.xcodeproj -target libmdp -configuration Debug"