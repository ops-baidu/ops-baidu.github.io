---
layout: page
title: Wiki of Baidu-Ops
tagline: 
---
{% include JB/setup %}

# Operation Data Processing

运维数据处理。为服务运维提供实时数据查询，计算，监控。

## Lead: 

- Zerd Liu ([@zerd_liu](http://github.com/zerdliu))

## Core member: 

- Yong Li ([@liyong19850209](http://github.com/liyong19850209))
- Xiao Li ([@swordsmanli](http://github.com/swordsmanli))
- Wenzhi Wang ([@wking1986](http://github.com/wking1986))
- Dongfang Qu ([@castomer](http://github.com/castomer))
- Weimin Zhang ([@lovemeng](http://github.com/lovemeng))
- Fengzhao Guo ([@rock-op](http://github.com/rock-op))

## Development Process

1. Fork 

   从[ops-baidu](https://github.com/ops-baidu)的github账号下fork项目仓库，your-account/Processingject
   ![](https://github-images.s3.amazonaws.com/help/Bootcamp-Fork.png)

1. Clone

		git clone git@github.com:/your-account/project

1. Create Branch

   在your-account的github页面上操作创建branch (feature_name)
   ![](https://github-images.s3.amazonaws.com/help/branch-selection-dropdown.png)

		git fetch
		git checkout feature_name

1. Development & commit 

		git add .
		git commit -m "commit issue"
		git push

1. Merge & Handle Conflicts

		git remote add upstream https://github.com/ops-baidu/project.git
		git fetch upstream
		git merge upstream/master
		git commit
		git push

1. Pull Request

   在github上发起[pull request](https://help.github.com/articles/creating-a-pull-request)

1. Rebase
   使origin的master和upstream的master同步

		git checkout master
		git fetch upstream
		git rebase upstream/master
		git push

1. Redo the Process

You can find [difference](http://stackoverflow.com/questions/9257533/what-is-the-difference-between-origin-and-upstream-in-github) between "origin" and "upstream"

### Tech
#### Operation Log Caculating

- [fluentd]()
- [kafka]()
- [storm](/tech/storm/)
- [mongoDB]()

#### Service Log Searching

- [logstash]()
- [ElasticSearch](/tech/es/)

#### Service Monitoring

- [zabbix]()

### Cases

- [mongoDB存储方式的选择]()
- [fluentd kafka storm消息发送与接收]()
- [在fluentd采集的日志中增加字段]()
- [zabbix信息采集异常定位方法]()

### Deployment Infomation

## Continuous Delivery Infranstructure



