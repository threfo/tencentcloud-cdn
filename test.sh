#!/bin/bash

# 指定文件夹路径
folder_path="./.github"

# 前缀
pre_str="http://a.com"

# 使用find命令查找文件夹及其子文件夹中的所有文件
file_list=$(find "$folder_path" -type f)

# 将文件列表转换为字符串数组
IFS=$'\n' read -rd '' -a file_array <<< "$file_list"

# 输出文件数组
echo "文件数组: ${file_array[@]}"

# 对file_array数组进行处理，把folder_path部分替换成pre_str
for i in "${!file_array[@]}"; do
    file_array[$i]=${file_array[$i]/#"$folder_path"/"$pre_str"}
done

# 输出处理后的文件数组
echo "处理后的文件数组: ${file_array[@]}"

# 把file_array数组用';'拼接成一个字符串
joined_string=$(IFS=$';'; echo "${file_array[*]}")
echo "拼接后的字符串: $joined_string"
