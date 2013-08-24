class baidu::zabbix::agent {
    include baidu::zabbix::params, baidu::zabbix::files

    package { "zabbix_agent":
            ensure    => latest,
            provider  => yum,
    }

    file {
        "${baidu::zabbix::params::zabbix_userparameter_config_dir}":
            ensure   => directory,
            owner    => work,
            group    => work,
            mode     => 755,
            require  => [ Package["zabbix_agent"], Class["${baidu::zabbix::files}"] ],
    }

    file {    "${baidu::zabbix::params::zabbix_agentd_conf}":
            owner    => work,
            group    => work,
            mode     => 644,
            content  => template("baidu/zabbix/zabbix_agentd_conf.erb"),
            notify   => Service['zabbix_agentd'],
            require  => [ Package["zabbix_agent"], Class["${baidu::zabbix::files}"] ],
    }

    service {
        "zabbix_agentd":
            binary      => "/etc/init.d/zabbix_agentd",
            enable      => true,
            ensure      => running,
            hasstatus   => false,
            hasrestart  => true,
            require  => [ Package["zabbix_agent"], File["${baidu::zabbix::params::zabbix_agentd_conf}", "${baidu::zabbix::params::zabbix_userparameter_config_dir}"] ],
    }
}

