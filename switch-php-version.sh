#!/bin/bash

#切換php 版本工具

# 檢查 brew 是否已安裝
if ! command -v brew &>/dev/null; then
  echo "請先安裝 brew。"
  exit 1
fi

# 取得目前的 PHP 版本
current_php_version=$(php --version | head -n 1 | awk '{print $2}')

# 提示使用者選擇 PHP 版本
echo "您要切換到哪個 PHP 版本？"
echo "(輸入版本號碼或 PHP 公式名稱。)"
read php_version

# 解除目前的 PHP 版本
brew unlink php@$current_php_version

# 安裝新的 PHP 版本
brew install php@$php_version

# 將新的 PHP 版本設定為預設
export PATH="/usr/local/opt/php@$php_version/bin:$PATH"

# 顯示成功訊息
echo "成功切換到 PHP $php_version。"