---
layout: page
title: "Kafka Page"
description: ""
---
{% include JB/setup %}
#kafka的安装方法

###kafka的官方网站
* [http://kafka.apache.org/](http://kafka.apache.org/)

###kafka的依赖

* 需要依赖jdk 1.6以上版本

###borker的安装

* 1 获取标准环境

* 2 解压缩到kafka目录下

* 3 修改配置文件config/server.properties，按照如下方式修改配置项

> brokerid = 整数，每个broker需要使用不同的id数值，可以采用该机器的nodes的group值
>
> port = 具体的端口号，默认为9092
>
> log.dir = 上游发送的日志文件在本地持久化保存的路径
>
> log.retention.hours = 上游发送的日志本地保存的小时数，依据本地磁盘使用情况而定
>
> zk.connect = zookeeper机器的地址和端口，格式为ip:port

###broker的启动

* start方式
> cd /home/work/kafka && nohup bin/kafka-server-start.sh config/server.properties </dev/null &

* stop方式
> kill 进程id