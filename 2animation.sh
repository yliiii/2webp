#!/bin/bash

# file_i +di[+xi+yi[+mi[bi]]]
#   file_i : 第i张webp文件
#   xi,yi : 该帧图像的偏移量
#   di : 到下一帧开始的暂停时间
#   mi : 该帧图像的处理方式，0没有背景，1有背景
#   bi : 该帧图像的混合方式，+b有混合，-b没有混合

cd $(pwd)

shopt -s nullglob nocaseglob extglob

FILES=""

for FILE in *.@(webp); do
    FILES="$FILES -frame $FILE +30+0+0+0-b";
done

# echo $FILES
webpmux $FILES -loop 0 -o out.webp;