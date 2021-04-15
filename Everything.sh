#!/bin/sh
#####################################
#查找服务器内文件
#####################################
## help function
 
function helpu{
   echo " "
   echo "通过文件名查找"
   echo "$0 [--math-case|--path] filename"
   echo " "
   exit
 }
 
## set variavles
 MATCH="-iname"
 SEARCH="."
 
## parse options
while [True]; do
if [ "$1" = "--help" -o "$1" = "-h" ];then
    helpu
elif [ "$1" = "--match-case" -o "$1" = "-m" ];then
    MATCH="-iname"
	shift 1
elif [ "$1" = "--path" -o "$1" = "-p" ];then
    SEARCH="${2}"
	shift 2
else
    break
fi
done
## 对输入的文件名处理
## 创建序列，记录位置
ARG=("${@}")
set -e

## 获取错误输入
if [ "X$ARG" = "X" ];then
    helpu
fi

## 查询
for query in ${ARG[*]};do
    /usr/bin/find "${SEARCH}" "${MATCH}" "${ARG}"
done
  