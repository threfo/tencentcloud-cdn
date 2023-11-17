#!/bin/bash

 # 指定文件夹路径
folder_path="./.github"
echo "FOLDER_PATH=$folder_path"

# echo "env.FOLDER_PATH: ${{env.FOLDER_PATH}}"

cos_url_path="/libs/js_sdk_starter/code"
echo "COS_URL_PATH=$cos_url_path"

# echo "env.COS_URL_PATH: ${{env.COS_URL_PATH}}"

# 前缀
pre_str="https://assets.belloai.com$cos_url_path/laster"

# 使用find命令查找文件夹及其子文件夹中的所有文件
file_list=$(find "$folder_path" -type f)

echo "文件数组: ${file_list[@]}"

# 将文件列表转换为字符串数组
file_array_str=$(awk -v RS="\n" -v ORS=";" '{print $0}' <<< "$file_list")

joined_string=$(echo $file_array_str | sed "s|$folder_path|$pre_str|g")

echo "拼接后的字符串: $joined_string"

# echo "OSS_URLS_STR=$joined_string"

# echo "env.OSS_URLS_STR: ${{env.OSS_URLS_STR}}"
