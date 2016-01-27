cacti template for dnsdist
====
URL : http://dnsdist.org/<br>
READ This : https://github.com/PowerDNS/pdns/blob/master/pdns/README-dnsdist.md

<br>
## Requirement<br>
OS:<br>
CentOS6<br>
Package:<br>
cacti-0.8.8b-7.el6.noarch<br>
dnsdist-0.0.667gdee7181-1pdns.el6.x86_64<br>
net-snmp-5.5-54.el6_7.1.x86_64<br>
net-snmp-libs-5.5-54.el6_7.1.x86_64<br>
net-snmp-utils-5.5-54.el6_7.1.x86_64<br>
<br>
## Install<br>
-- edit snmpd.conf<br>
$ cat snmpd.conf.add >> /etc/snmp/snmpd.conf<br>
<br>
-- check example<br>
$ cat /etc/snmp/snmpd.conf|grep dnsdist<br>
extend .1.3.6.1.4.1.18689.0.2 dnsdist /usr/local/bin/dnsdist-stats<br>
<br>
-- copy dnsdist-stats<br>
$ cp dnsdist-stats /usr/local/bin/<br>
$ chmod 755 /usr/local/bin/dnsdist-stats<br>
<br>
-- check example<br>
$ /usr/local/bin/dnsdist-stats<br>
acl-drops:0 latency1-10:1376 block-filter:0 latency10-50:22 cpu-sys-msec:13674 latency100-1000:6 cpu-user-msec:20429 latency50-100:1 downstream-send-errors:0 no-policy:0 downstream-timeouts:0 noncompliant-queries:0 dyn-block-nmg-size:0 queries:28930 dyn-blocked:0 rdqueries:28930 empty-queries:0 real-memory-usage:21782528 fd-usage:32 responses:28928 latency-avg100:386.0 rule-drop:0 latency-avg1000:348.5 rule-nxdomain:0 latency-avg10000:381.5 self-answered:2 latency-avg1000000:13.3 servfail-responses:0 latency-slow:0 trunc-failures:0 latency0-1:27523 uptime:2197<br>
<br>
-- copy dnsdist-stats.sh<br>
$ cp dnsdist-stats.sh /usr/share/cacti/scripts/<br>
$ chmod 755 /usr/share/cacti/scripts/dnsdist-stats.sh<br>
<br>
-- check example<br>
$ /usr/share/cacti/scripts/dnsdist-stats.sh 127.0.0.1 public<br>
acl_drops:0 latency1_10:1376 block_filter:0 latency10_50:22 cpu_sys_msec:13490 latency100_1000:6 cpu_user_msec:20283 latency50_100:1 downstream_send_errors:0 no_policy:0 downstream_timeouts:0 noncompliant_queries:0 dyn_block_nmg_size:0 queries:28930 dyn_blocked:0 rdqueries:28930 empty_queries:0 real_memory_usage:21782528 fd_usage:32 responses:28928 latency_avg100:386.0 rule_drop:0 latency_avg1000:348.5 rule_nxdomain:0 latency_avg10000:381.5 self_answered:2 latency_avg1000000:13.3 servfail_responses:0 latency_slow:0 trunc_failures:0 latency0_1:27523 uptime:2169<br>
<br>
<br>
## Notes
dnsdist -c -e "dumpStats()"の出力結果をグラフ化<br>
無かったので自作<br>
