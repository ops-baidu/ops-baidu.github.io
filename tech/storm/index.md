---
layout: page
title: "Index"
<<<<<<< HEAD
description: "storm development document"
---
{% include JB/setup %}
#Part One
##storm cluster install cookbook
- lead:lixiao01
- core:member: lixiao01
####storm dependency packages
* zookeeper
* zjmq
* java6+
* zmq2.1.7
* python2.6.6
* all modules installing needs top user "root" 

1. zjmq install

		git clone https://github.com/nathanmarz/jzmq.git
		cd jzmq
		./autogen.sh
		./configure
		make
		sudo make install

2. zmq install

		wget zeromq-2.1.7.tar.gz
		tar -xzf zeromq-2.1.7.tar.gz
		cd zeromq-2.1.7
		./configure
		make && make install

3. zk install
3.1. install zk

		wget http://labs.mop.com/apache-mirror/zookeeper/zookeeper-3.3.5/zookeeper-3.3.5.tar.gz
		tar -zxvf zookeeper-3.3.5.tar.gz
		cp -R zookeeper-3.3.5 /usr/local/
		ln -s /usr/local/zookeeper-3.3.5/ /usr/local/zookeeper
		vim /etc/profile (set ZOOKEEPER_HOMEºÍZOOKEEPER_HOME/bin)
		export ZOOKEEPER_HOME="/usr/local/zookeeper"
		export PATH=$PATH:$ZOOKEEPER_HOME/bin
		cp /usr/local/zookeeper/conf/zoo_sample.cfg /usr/local/zookeeper/conf/zoo.cfg

3.2. config zk cluster

		configurate zoo.cfg like this below
		clientPort=2181
		server.1=XXX.XXX.XXX.XXX:3887:4887
		server.2=XXX.XXX.XXX.XXX:3887:4887
		server.3=XXX.XXX.XXX.XXX:3887:4887
		cd /tmp/zookeeper
		touch myid and fill it with 1/2/3/... distinguishly

4. setting up a storm cluster

		https://github.com/nathanmarz/storm/wiki/Setting-up-a-Storm-cluster
#the end

#Part Two

1. experience of developing kafka storm introduction

1.1. use local mode to develop

>you can use local mode to test weather the spout or bolt logical is right or not
>
>To create an in-process cluster, simply use the LocalCluster class. For example:
>
		import backtype.storm.LocalCluster;
		LocalCluster cluster = new LocalCluster();
>
>To shutdown a local cluster, simple call:
>
		cluster.shutdown();
>
>to build and run the topology to use:
>
		mvn -f pom.xml -e compile exec:java -Dexec.classpathScope=compile -Dexec.mainClass=com.baidu.storm.topology.LogStreamTopology

2. use cluster mode to submit a jar

>you can use cluster mode to run a topology distributedly
>
>>first,Define the topology (Use TopologyBuilder if defining using Java)
>
>>second,Use StormSubmitter to submit the topology to the cluster. StormSubmitter takes as input the name of the topology, a configuration for the topology, and the topology itself. For example:
>
		Config conf = new Config();
		conf.setNumWorkers(20);
		conf.setMaxSpoutPending(5000);
		StormSubmitter.submitTopology("mytopology", conf, topology);
>
>to build and run the jar to use:
>
>>first, build the source
>
		cd kafka-storm-dev && mvn assembly:assembly
>
>>second, submitting the jar file to the cluster
>
>>>storm jar storm-imas.jar com.baidu.storm.topology.LogStreamTopology "imas_d"
>
#the end

#Part Three
