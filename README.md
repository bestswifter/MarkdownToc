<!--begin toc-->

* [Introduction](#0)
* [Installation](#1)
* [Usage](#2)
* [Sample](#3)
* [Bug](#4)
* [介绍](#5)
* [安装](#6)
* [使用](#7)
* [示范效果](#8)
* [Bug](#9)

<!--end toc-->


<a name=0></a>
# Introduction
This is a light-weight tool to add Toc(Table Of Content) to your markdown file. It only works for those titles come from **# title**

<a name=1></a>
# Installation
This tool is written in swift. So, what you need to do is to download the project, build & run. Then you need to find the product(an executable file) called **MarkdownToc**
For convenience, you can copy this executable file into `/usr/local/bin` so that you can run it directly in your terminal withou need to enter the long path.

<a name=2></a>
# Usage
You should run the code below: 
```
MarkdownToc <MarkdownFile Path>
```
For example:
```
MarkdownToc /Users/bestswifter/Desktop/README.md
```
When you see the toast : **You have successfully add toc to your markdown file!**. It means you are done (*\^__^\*)
Everytime you update your file, just rerun the code again. You don't need to worry anything else.

<a name=3></a>
# Sample
You can see two markdown files in this repository named **Before** and **After**. You feel free to compare these two files.

<a name=4></a>
# Bug
1. You can't automatically undo the Toc. If you don't like it, you have to delete the words manually
2. The appearance of the Toc is not as pretty as I expected
3. In some cases, it will lose some blank lines.
I will try my best to fix these as soon as possible

<a name=5></a>
# 介绍
这是一个可以为你的 markdown 文件添加 Toc 的简单工具。它会自动提取所有以井号开头的标题并生成一个标题列表。

<a name=6></a>
# 安装
这个工具用 Swift 写成，所以你应该首先下载 Swift 工程，编译并运行，在 Xcode
左侧的 **Products** 文件夹中找到最终的可执行文件。
为了简单起见，你可以把这个可执行文件复制到 `/usr/local/bin` 目录下，这样运行这个文件时就不必输入冗长的路径了。

<a name=7></a>
# 使用
在终端中输入如下命令：
```
MarkdownToc <你的markdown文件的目录>
```
比如：
```
MarkdownToc /Users/bestswifter/Desktop/README.md
```
当你看到这个提示：**You have successfully add toc to your markdown file!** 时，你就完成了。
每次你修改了 markdown 文件后，你只要重新运行命令即可，并不用担心会产生冲突

<a name=8></a>
# 示范效果
你可以在这个仓库下找到两个 markdown 文件，他们分别叫做 **Before** 和 **After**。你可以自行对比这两者的区别。

<a name=9></a>
# Bug
目前已知的不足主要有三处：
1. 目前还不支持自动删除 Toc，如果不喜欢这个样式或功能，必须手动删除
2. Toc 列表没有我想象中那么好看
3. 在某些情况下会丢失空白行。
我会尽快修改这些 bug。
