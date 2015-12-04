cacti template for dnsdist
====
<br>
## Requirement<br>
OS:CentOS6<br>
Package:cacti-0.8.8b-7.el6.noarch<br>
<br>
## Install<br>
edit snmpd.conf<br>
cat snmpd.conf.add >> /etc/snmp/snmpd.conf<br>
<br>
check example<br>
[root@dnsdisthost /]# cat /etc/snmp/snmpd.conf|grep dnsdist<br>
extend .1.3.6.1.4.1.18689.0.2 dnsdist /usr/local/bin/dnsdist-stats<br>
<br>
copy dnsdist-stats<br>
cp dnsdist-stats /usr/local/bin/<br>
<br>
check example<br>
[root@dnsdisthost /]# /usr/local/bin/dnsdist-stats<br>
acl-drops:0 latency1-10:1135 block-filter:0 latency10-50:14263 cpu-sys-msec:34671 latency100-1000:5537 cpu-user-msec:18225 latency50-100:2808 downstream-send-errors:0 no-policy:0 downstream-timeouts:0 noncompliant-queries:0 dyn-block-nmg-size:0 queries:205476 dyn-blocked:0 rdqueries:205476 fd-usage:33 real-memory-usage:5861376 latency-avg100:34656.4 responses:205473 latency-avg1000:29300.9 rule-drop:0 latency-avg10000:12758.9 rule-nxdomain:0 latency-avg1000000:1825.3 self-answered:0 latency-slow:13 servfail-responses:0 latency0-1:174155 trunc-failures:0 uptime:6890<br>
<br>
copy dnsdist-stats.sh<br>
cp dnsdist-stats.sh /usr/share/cacti/scripts/<br>
<br>
check example<br>
[root@dnsdisthost /]# /usr/share/cacti/scripts/dnsdist-stats.sh 127.0.0.1 public<br>
acl_drops:0 latency1_10:1221 block_filter:0 latency10_50:14458 cpu_sys_msec:35487 latency100_1000:5614 cpu_user_msec:18632 latency50_100:2849 downstream_send_errors:0 no_policy:0 downstream_timeouts:0 noncompliant_queries:0 dyn_block_nmg_size:0 queries:211184 dyn_blocked:0 rdqueries:211184 fd_usage:33 real_memory_usage:5869568 latency_avg100:33947.4 responses:211181 latency_avg1000:16503.4 rule_drop:0 latency_avg10000:9813.5 rule_nxdomain:0 latency_avg1000000:1843.4 self_answered:0 latency_slow:13 servfail_responses:0 latency0_1:179358 trunc_failures:0 uptime:6990<br>
<br>
