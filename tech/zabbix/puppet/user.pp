class baidu::zabbix::user {
    include baidu::zabbix::params

    user { 'zabbix':
        ensure      => 'present',
        home        => "${baidu::zabbix::params::zabbix_user_home_dir}",
        password    => 'zabbix',
        shell       => '/bin/bash',
        gid         => 'zabbix',
        managehome  => 'true',    
    }
    
    group { 'zabbix':
        ensure      => 'present',
    }
}
