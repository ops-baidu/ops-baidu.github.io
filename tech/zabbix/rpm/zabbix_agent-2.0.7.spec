%define _topdir 
%define debug_package %{nil}
%define zabbix_home /home/work/zabbix
%define %{_initrddir} /etc/init.d

Summary:   RPM for zabbix agent
Name:      zabbix_agent
Version:   2.0.7
Release:   5
Vendor:    zabbix
License:   GPL
Group:     Applications/Internet
BuildRoot: %{_builddir}/%{name}
Packager:  guofengzhao
Source0:  %{name}-%{version}.tar.gz
Source1:  %{name}d.init
Requires(post):     /sbin/chkconfig
Requires(preun):    /sbin/chkconfig
Requires(preun):    /sbin/service
%description
The zabbix agent, to be installed on monitored system.

%prep
rm -rf ${buildroot}
%setup -c 

%build
mkdir -p %{buildroot}%{zabbix_home}
mkdir -p %{buildroot}%{_initrddir}

%install
cp -r %{name}-%{version}/* %{buildroot}%{zabbix_home}
%{__install} -D -p -m 0755 %{SOURCE1} %{buildroot}%{_initrddir}/%{name}d

%clean
rm -rf %{buildroot}

%post
grep -q %{name} /etc/services || cat >> /etc/services <<EOF    
zabbix_agentd    10050/tcp          #Zabbix Agent    
zabbix_agentd    10050/udp          #Zabbix Agent 
EOF
# Add zabbix-agent to system start-up
/sbin/chkconfig --add %{name}d
/sbin/chkconfig %{name}d on

%preun
# Stop and disable service before removal
/sbin/service %{name}d stop >/dev/null 2>&1 || :
/sbin/chkconfig --del %{name}d
sed -i "/%{name}/d" /etc/services

%files
%defattr(-,work,work)
%{zabbix_home}
%attr(755,root,root) %{_initrddir}/%{name}d
