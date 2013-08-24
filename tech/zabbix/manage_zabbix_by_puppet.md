---
layout: page
title: "使用puppet管理zabbix"
description: ""
---
{% include JB/setup %}

## 编译并打包

### zabbix_agent

- 源码编译zabbix_agent
  * 下载最新源码包，按照官网文档进行安装
  * 编译时使用--enable-static, 以便于快速安装zabbix agent

- 将zabbix_agent打成rpm包管理
  * [zabbix_agent.spec]()
  * [zabbix_agentd.init]()


### zabbix_master

### zabbix_proxy


## puppet描述文件



