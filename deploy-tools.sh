#!/bin/bash

# 获取当前脚本所在的目录
script_dir=$(cd "$(dirname "$0")" && pwd)

# 构建 switch-php.sh 的绝对路径
switch_php_path="$script_dir/switch-php.sh"

# 将 switch-php 函数定义添加到 .zshrc 文件末尾
sed -i '' '$ a\
\
function switch-php() {\
  . '"$switch_php_path"' "$@"\
}' ~/.zshrc

# 显示成功讯息
echo "已成功将 'switch-php' 添加为自定义指令。"