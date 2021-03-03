#!/bin/bash
# reference: https://www.jianshu.com/p/61ab330a6de6

# -m int 在0-6之间指定压缩方法。默认值为4。
# -q float 指定压缩质量，范围是0-100，默认为75
# -mt 如果可能的话，使用多线程编码
# -af 自动过滤，该算法将花费额外的时间来优化过滤强度，以达到平衡的质量。

PARAMS=('-m 6 -q 75 -mt -af -progress')

if [ $# -ne 0 ]; then
	PARAMS=$@;
fi

cd $(pwd)

shopt -s nullglob nocaseglob extglob

for FILE in *.@(jpg|jpeg|tif|tiff|png); do 
    cwebp $PARAMS "$FILE" -o "${FILE%.*}".webp;
done