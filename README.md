# no_use_file
这是一个shell脚本, 用于查找项目中未被引用的文件, 输出一个文件列表. 例如查找php项目中的未被引用的模板文件. 
判断是否被引用过的标准是搜索文件路径是否在项目代码中出现过, 所以自动加载或变量拼接的路径无法判断. 检查结果只能用于参考.

##使用方法
    $ ./no_use_file.sh <文件目录> <代码目录>
    如: ./no_use_file.sh /web/xxx/View/ /web/xxx/
    将查找在"文件目录"中, 且路径未在"代码目录"的文件中引用过的的文件
    
###说明
* 目录都要以"/"结尾
* 从"文件目录"下提取文件路径,默认只提取html类型的文件, 可以在脚本中修改配置
* 提取的文件路径不包含"文件目录"部分. 以上面例子说明, 文件"/web/xxx/View/admin/list.html"提取的路径未"admin/list.html"
* 默认情况下"代码目录"中只有php和html类型文件会被搜索, 可在脚本中配置类型

##依赖
* awk
* find
* grep
* xargs
