vi 的操作和配置
==============
基本操作
-----
:sh         开始一个shell命令行，ctr-D 回到vi
ctrl+z & fg 在vi中，可以ctr-z suspend vi进入命令行，然后fg回到vi
:verbose set option?  查看这个option是什么值，在那个配置文件里设置的
:script     查看vim加载的配置脚本
vim -u      加载vim配置文件，比如vim -u ~/.vimrc
vim -u NONE 什么都不加载
移动光标
-------
z <enter>   把当前行移到屏幕的开始(zt)
z.          把当前行移动屏幕的中间(zz)
z-          把当前行移动到屏幕的底部(zb)
ctrl + L    重绘当前页面
H           移动光标到屏幕顶
L           移动光标到屏幕底
M           移动光标到屏幕中
``          返回光标移动前的位置
J           合并两行
ctrl+E      向上滚动屏幕，光标所在行的位置不变
ctrl+Y      向下滚动屏幕，光标所在行的位置不变
ctrl+D      向下滚动半屏
ctrl+F      向下滚动一屏
ctrl+U      向上滚动半屏
ctrl+B      向上滚动一屏
:ju[mps]    打出跳转表
ctrl+O      转到跳转表里第 [count] 个较旧的光标位置
ctrl+I      转到跳转表里第 [count] 个较新的光标位置
'0          打开一个以前打开过文件，按'0可以把光标回到最后退出文件时光标所在的位置
gd          Goto local Declaration
gD          Goto global Declaration
gf          Goto file
[I          Display all lines that contain the keyword under the cursor
ctrl+]      跳到函数定义,根据tag来跳转
ctrl+T      和ctrl+]相反
K           看光标所指的标识符的 man文件
0           数字零，到行头
^           到本行第一个不是blank字符的位置
$           到本行行尾
g_          到本行最后一个不是blank字符的位置
%           匹配括号移动，包括 (, {, [. （需要把光标先移到括号上）
文本搜索
-------
f(F)x       在光标所在行进行查找, 查找光标右(左)方第一个x字符.
t(T)x
\c          不区分大小写
q:          搜索历史命令记录
q/          搜索历史搜索记录
编辑文本
-------
$           代表文件的最后一行
%           代表文件里的所有行
:.,$d       从当前行删除到文件结尾
:m+         把当前行下移一行
:20,.m$     把20行到当前行的内容移动到文件末尾 
:.,+20d     把从当前行开始的20行删除
:226,$m.-2  把226行到文件结尾的行移动到当前行的前面两行处 
:/pattern/d 把下一个匹配的行删除
:/pattern/+d把下一个匹配的下一行删除
:3,18d      3到18行删除
:160,224m23 把160到224行的内容移到23行下
:23,29co100 把23到29行的内容复制到100下
:1,30s/his/the/gc  1至30行用the替换his，替换之前确认
:g/pattern/s/old/new/g 第一个g意思是对全部的行，第二个g是在同一匹配到的行内进行所有替换
:g/^/m0     把文件倒序(第一行变成最后一行)
:%s/string/&/gn  统计string出现的次数
:20,30!sort 20至30行排序
\n          会被第n个匹配替换
&           会被整个匹配替换
\u 或者 \l 把下一个字符转换为大写或者小写
\U 或者 \L \e \E把下面的字符置换为大家或者小写直到匹配的末尾或者是遇到\e 或\E
:%s/Fortran/\U&/ 把所有的Fortran转换为FORTRAN
/s          分隔符可以为 # $ 等
~           是改变大小写
:e!         是回退所有从上次保存以来所有的更改
:%d         删除所有行
d?move      从当前光标处向前删除直到move
V           选中当前行
yy或Y       复制当前行
qa          开始record到a
q           退出record
@a          重放record a
ctrl+N      补全, 根据当前文档里已经出现的来补全
ctrl+P      
<<          向左缩进
>>          向右缩进
Ctrl+A / Ctrl+X 
            increments/decrements a number.
!)tr '[:lower:]' '[:upper:]' 把下面一段从小写变成大写
文件编辑
-------
vi +n file  在第n行打开文件file
vi +/pattern file 在第一次匹配的地方打开file
vi -R file  以只读的方式打开file（相当于view file?)
:230,$w newfile 把230行到文件末尾保存到newfile里
:340,$w >>newfile 把340行到文件末尾追加到newfile里
:185r newfile 把newfile的内容读进当前文件的185行处
vi file1 file2 ...编辑文件1 2 。。。
:n          编辑下一下文件
:rew        rewind to file1
:last       to last file
:args (:ar) 列出当前vi打开的文件(当前打开的文件用[])
:ls         列出buffer，作用同args
:b {number, expression}
            编辑buffer里第number个文件，number可为2，3，4.。。
:bn[ext]    下一个缓冲区
:bp[revious]上一个缓冲区
:bd tab ... 删除buffer
:bw tab ... 清空buffer
%           (current filename)
#           (alternate filename)
ctrl+^      在current和alternate之间切换
:e file     编辑文件file
:w %.new    把当前文件重命名为filename.new
粘贴板和标记
-----------
:reg        查看粘贴
vi 默认用1-9到命名九个粘贴板
"2p         把粘贴板 2 里的内容粘贴出来
"ayy        把当前行放进命名buffer a里
"A          当用大写字母命名一个粘贴板时，粘贴板里的内容是append的方式添加
"Z5dd       删除五行，然后把这五行append到用Z命名的buffer中
mx          用x来标记当前光标的位置，x可以为任何字母
mX          用X来标记一个文件，X为任何大字字母，这个标记可以用文件间跳转
'x          返回标记所在的行
`x          光标返回标记
模式切换
-------
v           进入visual模式
ctrl+v      区块选取
< >         在visual模式下左右缩进选中的文本
=           在visual模式下自动缩进选中的文本
vi          在ex模式下，按vi回到vi
:=          显示文件的总行数
:.=         显示当前的行数
ctrl+G      同上
Q           进入ex模式
:1,10#      显示1到10行
:/pattern/= 显示第一次匹配到的行数
:/pattern1/,/pattern2/d 把下一个匹配到pattern1到下一个匹配到pattern2的行删除

在vi中执行命令：
:r !date    把date输出写到vi光标处
:96,99!sort 96到99行排序


:ab abbr long command   把long command用abbr来代替
:unab abbr  取消abbr
:map v dwelp交换单词
:unmap 

vim 新增的motion
count%      把光标移动到count%行处
:help text-objects 查看text-object帮助
aw          包括单词前后空格
iw          不包括单词前后空格
as          一个句子
is          inner sentense
a”          a double quoted string
i”          inner double quoted string
a’          a single quoted string
i’          inner single quoted string
a`          a back quoted string
i`          inner back quoted string
a)          a parenthesized block
i)          inner parenthesized block
a]          a bracketed block
i]          inner bracketed block
a}          a brace block
i}          inner brace block

多窗口
-----
vim -o file1 file2 打开multiwindow
:sp[lit]    分隔两个水平窗口
:vs[plit]   分隔出两个垂直窗口
:new        打开一个水平分隔的窗口
Ctrl+w s    水平分割当前窗口
Ctrl+w v    垂直分割当前窗口
Ctrl+w q    关闭当前窗口
Ctrl+w n    打开一个新窗口（空文件）
Ctrl+w o    关闭出当前窗口之外的所有窗口
Ctrl+w T    当前窗口移动到新标签页
Ctrl+w h    切换到左边窗口
Ctrl+w j    切换到下边窗口
Ctrl+w k    切换到上边窗口
Ctrl+w l    切换到右边窗口
Ctrl+w w    遍历切换窗口
Ctrl+w t    把光标移动到左上角的窗口(t = top)
Ctrl+w b    把光标移动到右下角的窗口(b = bottom)
Ctrl+w H    向左移动当前窗口
Ctrl+w J    向下移动当前窗口
Ctrl+w K    向上移动当前窗口
Ctrl+w L    向右移动当前窗口
Ctrl+w +    增加窗口高度
Ctrl+w -    减小窗口高度
Ctrl+w =    统一窗口高度
代码折叠
-------
za          打开或者关闭折叠
zM          折叠所有
zR          打开所有折叠
