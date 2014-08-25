create database zabbix character set utf8;
grant all privileges on zabbix.* to zabbix@localhost identified by 'passwd';
FLUSH PRIVILEGES;
