---
layout: page
title: "自顶向下阅读storm源码"
description: ""
---
{% include JB/setup %}

## 前期准备

### storm 基础

- [storm的简易教程](https://github.com/nathanmarz/storm/wiki/Tutorial)：storm cluster，topology，stream，stream grouping

   * 逻辑结构(利用storm编程)：stream，stream grouping，tuple，spout，bolt， topology
   * 物理结构(storm内部实现)：nimbus，zookeeper, supervisor，node，worker，executor

- 设计理念：[Concepts](https://github.com/nathanmarz/storm/wiki/Concepts)[Rationale](https://github.com/nathanmarz/storm/wiki/Rationale)

- [并发](https://github.com/nathanmarz/storm/wiki/Understanding-the-parallelism-of-a-Storm-topology)：worker和task的对应关系

- [clojure DSL](https://github.com/nathanmarz/storm/wiki/Clojure-DSL)

### clojure教程：
- [programming clojure](http://pragprog.com/book/shcloj2/programming-clojure)有中文版，但看英文版比较好
- [clojure - Functional Programming for the JVM](http://java.ociweb.com/mark/clojure/article.html)
- [clojure教程参考](http://learn-clojure.com/clojure_tutorials.html)

## 阅读源码：

wiki上推荐从thrift开始读。我换了一个角度，从测试代码开始读。在读测试代码之前，我读了以下这篇文章，对整体上有了一些粗浅的了解

- [topology的生与死](https://github.com/nathanmarz/storm/wiki/Lifecycle-of-a-topology)


to be continued
