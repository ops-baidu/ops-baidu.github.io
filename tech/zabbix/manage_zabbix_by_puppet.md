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
  * [zabbix_agent.spec](/tech/zabbix/rpm/zabbix_agent-2.0.7.spec)
  * [zabbix_agentd.init](/tech/zabbix/rpm/zabbix_agentd.init)


### zabbix_master

### zabbix_proxy


## puppet描述文件

- manifests
  * [files.pp](/tech/zabbix/puppet/files.pp)
  * [agent.pp](/tech/zabbix/puppet/agent.pp)
  * [params.pp](/tech/zabbix/puppet/params.pp)
  * [user.pp](/tech/zabbix/puppet/user.pp)
