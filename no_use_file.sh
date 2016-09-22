#!/bin/bash

#检查未使用过的模板文件

#配置
code_file_types=".php .html" #搜索的代码文件类型, 空格分隔
search_file_type=".html"     #被检查的文件类型



if [ $# != 2 ];then
	echo $0 "<文件目录> <代码目录>"
	echo "如:" $0 "/web/xxx/View /web/xxx/"
	exit
fi

#参数
dir_f=$1 #文件目录
dir_s=$2 #代码目录

dir_c=`dirname $0`/ #当前目录

#文件
f_idx=$dir_c${prefix}tpl_idx.txt #临时索引文件
#f_ret=$dir_c${prefix}ret.txt     #结果列表文件

#生成模板路径索引文件
echo '' > $f_idx
for t in $code_file_types
do
    find $dir_s -name "*$t" |xargs -I {} grep -FnH $search_file_type {} >> $f_idx  #搜索php文件 
done;

#检查模板文件被引用的情况, 输出未被引用的文件
find $dir_f -name "*$search_file_type" |xargs -I {} awk -v key={} -v dir=$dir_f 'BEGIN{n=0;gsub(dir,"",key);}{if(match($0,key))n++;}END{if (n==0) print  key}' $f_idx

#删除临时索引文件
rm $f_idx








