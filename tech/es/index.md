---
layout: page
title: Wiki of ElasticSearch
tagline:
---

{% include JB/setup %}

## Wiki of ElasticSearch

-writter : Wang Wenzhi

### ElasticSearch 概述
ElasticSearch是专为云计算设计的一款灵活的，开源的，实时的，具有分布式的特点的，功能强大的搜索引擎(http://www.elasticsearch.org/)
### ElasticSearch 安装
1.安装java环境
安装ES之前需要安装jdk建议至少1.6以上，如果是ubuntu的环境可以使用以下命令：
sudo apt-get install openjdk-7-jdk
如果在开发机上安装可以使用以下命令：
yum install jdk6-1.6.0-27.x86_64.rpm
设置环境变量：
vim /etc/profile
export JAVA_HOME=/home/work/local/jdk1.6.0_27_x64
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin
source /etc/profile
1.下载elasticsearch的软件包
http://www.elasticsearch.org/download/
tar zxvf elasticsearch.tar.gz
es不需要复杂的安装，可以直接进入解压目录，直接启动
elasticsearch/bin/elasticsearch -f


