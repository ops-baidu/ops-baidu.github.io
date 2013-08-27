---
layout: page
title: "Kafka Page"
description: ""
---
{% include JB/setup %}
#kafka的安装方法

###kafka的官方网站
* [http://kafka.apache.org/](http://kafka.apache.org/)
* [https://github.com/apache/kafka](https://github.com/apache/kafka)

###kafka的依赖

* 需要依赖jdk 1.6以上版本

###borker的安装

* kafka目前有0.7和0.8两个版本，项目中使用的是0.7版本的kafka

* rpm或者sbt编译的方式得到标准环境

> sbt编译，需要编译机器可以访问外网
>
> cd /home/work/kafka
>
> ./sbt update
>
> ./sbt package

* 解压缩到kafka目录下

* 修改配置文件config/server.properties，按照如下方式修改配置项

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

* borker启动的依赖
> broker启动后会在zookeeper上注册自己的id,在zookeeper的web界面roshan上可以看到当前运行的broker列表

> 项目中每个topic使用了一个parttion（分区）,在roshan上可以看到不同的topic在broker上的分布情况
