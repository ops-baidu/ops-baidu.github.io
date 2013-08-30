---
layout: page
title: Wiki of Baidu-Ops
tagline: 
---

## Fluentd简介

"Fluentd"是一个开源的日志收集系统，支持150+个插件，能够将日志收集到MongoDB, Redis, Amazon S3等等；Fluent能够以json格式来处理日志，具备每天收集5000+台服务器上5T的日志数据，每秒处理50000条消息的性能；

#### 安装

*  Step0: 安装Ruby
 
首先，安装Ruby，要求版本>=1.9.2;
 
*  Step1: 安装Fluentd的gem包
 
安装命令如下：
 
	 $ gem install fluentd --no-ri --no-rdoc
 
*  Step2: 运行
 
运行以下命令来验证fluentd已安装成功；
 
	 $ fluentd --setup ./fluent
 
此命令会在当前目录下创建名为fluent.conf的配置文件；
 
	 $ fluentd -c ./fluent.conf -vv &
 
运行以上命令将启动fluentd服务；发送SIGHUP信号，将会重载配置文件；
 
	 $ echo '{"json":"message"}' | fluent-cat debug.test
 
运行该命令将会发送一条消息‘{“json”:”message”}’，相应的tag为“debug.test”，如果安装成功，则fluentd会输出以下消息：
 
	 2013-08-10 16:49:50 +0900 debug.test: {"json":"message"}

#### 配置
配置文件允许用户控制Fluentd的输入和输出行为，指定输入输出插件和插件参数；一般的fluentd的配置文件如下：
	
	<source>
		type tail
		format apache
		path /var/log/apache2/access_log
		tag mongo.apache
	</source>
	<match mongo.*.*>
		# plugin type
		type mongo
		# mongodb db + collection
		database apache
		collection access
		# mongodb host + port
		host localhost
		port 27017
		# interval
		flush_interval 10s
	</match>
	
这个配置文件由以下两部分构成：
 
1. source 指定输入资源
	
其中：
 
		 type tail: tail方式是 Fluentd 内置的输入方式，其原理是不停地从源文件中获取新的日志。
		 format apache: 指定使用 Fluentd 内置的 Apache 日志解析器。
		 path /var/log/apache2/access_log: 指定日志文件位置。
		 tag mongo.apache: 指定tag，tag被用来对不同的日志进行分类
	
每个source指令必须包含一个type（类型）参数，type参数指定输入插件使用。source把事件提交到fluentd的路由引擎中。一个事件包含三个实体标签：tag,time和record。tag是一个通过.来分离的字符串（例如myapp.access），用作Fluentd内部路由引擎的方向，time是当事件产生unix时间，而record是一个JSON对象。

1. match 指定输出目的地
	
match标签后面可以跟正则表达式以匹配我们指定的tag，只有匹配成功的tag对应的日志才会运用里面的配置，type参数指定输出插件使用，flush_interval是用来控制多长时间将日志写入MongoDB一次。
另外，可以使用include来导入单独的配置文件；
 
#### 插件
运行 gem search -rd fluent-plugin 可以获取到所有的插件;
 
运行 gem install fluent-plugin-name --no-ri --no-rdoc 即可安装插件；


