---
layout: post
title: "logstash入门"
description: "introduction of logstash"
category: logstash 
tags: [logstash log]
---
{% include JB/setup %}

# 简介
[logstash](http://logstash.net)是一个基于[jruby](http://jruby.org)的开源日志收集与管理工具.

# 功能
- 收集
- 解析
- 发送
- 索引

# 特点
- 分层架构：(输入)input=>(解析与数理)filter=>(发送与存储)output
- 基于插件: 主要功能通过插件的形式提供，官方提供丰富的插件支持；支持基于ruby和erlang插件的开发。
- 强大的解析功能，可根据需要在filer层对数据进行自定义格式化，增加、删除字段。

# logstash使用 

1. [下载](http://logstash.objects.dreamhost.com/release/logstash-1.1.13-flatjar.jar)logstah

2. 环境要求:java logstash使用jruby编写，logstash以jar包的形式发行，将所需的lib打包，所以不需要安装jruby。

3. 编写配置文件

`
    input {
      stdin { 
        type => "human"
      } 
    }
    
    output {
      stdout {
        debug => true
      }
    }

`

- 配置文件编写[参考](http://logstash.net/docs/1.1.13/configuration)

1. 启动logstash
    
    `java -jar logstash-1.1.13-flatjar.jar agent -f hello.conf`
- 启动后，可尝试在标准输入输入一些字符，看一下效果。
- 命令行参数[参考](http://logstash.net/docs/1.1.13/flags)


# [最佳实践](http://cleversoft.wordpress.com/2013/04/05/887/)
- logstash=>redis=>logstash=>elasticsearch=>kibana


# 遇到的问题
- logstash 1.1.13 flatjar版本在RHAS4.3(2.6.9)无法启动。解决办法：使用logstash 1.1.9 monolithic版本。
- logstash在RHAS4.3(2.6.9)输入插件file无法使用。

# 参考 
- [十分钟快速入门](http://logstash.net/docs/1.1.13/tutorials/10-minute-walkthrough/)
- [单机安装配置](http://logstash.net/docs/1.1.13/tutorials/getting-started-simple)
- [集群配置](http://logstash.net/docs/1.1.13/tutorials/getting-started-centralized)

