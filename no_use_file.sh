#!/bin/bash

#检查未使用过的模板文件

#配置
file_types=".php .html"



if [ $# != 2 ];then
	echo $0 "<模板文件目录> <搜索模板文件路径的范围>\n"
	echo "如:" $0 "View Controller\n"
	exit
fi

#参数
dir_tpl=$1
dir_s=$2
prefix=$3

dir_c=`dirname $0`/ #当前目录

#文件
f_tpl_idx=$dir_c${prefix}tpl_idx.txt
f_ret=$dir_c${prefix}ret.txt

#生成模板路径索引文件
echo '' > $f_tpl_idx
for t in $file_types
do
    find $dir_s -name "*$t" |xargs -I {} grep -FnH ".html" {} >> $f_tpl_idx  #搜索php文件 
done;

#检查模板文件被引用的情况
find $dir_tpl -name "*.html" |xargs -I {} awk -v key={} -v dir=$dir_tpl 'BEGIN{n=0;gsub(dir,"",key);}{if(match($0,key))n++;}END{if (n==0) print  key}' $f_tpl_idx

#rm $f_tpl_idx








