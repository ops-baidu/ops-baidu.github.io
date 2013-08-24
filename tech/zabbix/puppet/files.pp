class baidu::zabbix::files {
    include baidu::zabbix::params

    file { "${baidu::zabbix::params::zabbix_config_dir}":
            ensure    => directory,
            owner     => work,
            group     => work,
            mode      => 755,
    }

    file { "${baidu::zabbix::params::zabbix_log_dir}":
            ensure    => directory,
            owner     => work,
            group     => work,
            mode      => 755,
    }

    file { "${baidu::zabbix::params::zabbix_user_home_dir}":
            ensure    => directory,
            owner     => work,
            group     => work,
            mode      => 755,
    }
}
