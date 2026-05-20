#!/usr/bin/env ruby
# frozen_string_literal: true

# 在 mdp_parse_file 函数开头添加 fopen 检测，
# 用于诊断 Sandbox 是否阻止了 C++ 的文件访问

cpp_path = File.expand_path('../mal-server/src/sources/c++/c_ffi/mdp_ffi.cpp', __dir__)
content = File.read(cpp_path)

# 检查是否已经加上过 debug
if content.include?('fopen_debug')
  puts "fopen_debug already present, skipping"
  exit
end

# 在 `mdp_parse_file` 函数体的 `try {` 之前插入 fopen 检测
old = <<~OLD.chomp
    if (!session || !path) return nullptr;

    try {
OLD

new = <<~NEW.chomp
    if (!session || !path) return nullptr;

    // fopen_debug: 检查 C++ 能否直接访问该文件（Sandbox 诊断）
    FILE* fp_ = fopen(path, "rb");
    if (!fp_) {
        fprintf(stderr, "[mdp_ffi_DIAG] fopen(%s) FAILED: errno=%d\\n", path, errno);
    } else {
        fprintf(stderr, "[mdp_ffi_DIAG] fopen(%s) OK\\n", path);
        fclose(fp_);
    }

    try {
NEW

content.sub!(old, new)
File.write(cpp_path, content)
puts "Added fopen debug check to mdp_ffi.cpp"