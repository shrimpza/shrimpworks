---
categories:
- Linux
date: "2018-01-27T00:00:00Z"
published: true
tags:
- Debian
- StatsD
- Monitoring
title: Publishing Server Status to StatsD with no additional software
slug: linux-statsd
---

I recently wanted to set up a couple of rough monitoring services to keep track
of simple server status, load, disk etc. While there are options available like
[Munin](https://munin-monitoring.org/) which can do this by installing agents
on the machines to be monitored, I wanted something a little simpler and more 
portable.

I'm quite fond of the StatsD + Graphite + Grafana stack, which is quite easy to
run thanks to [Kamon's grafana_grafite](https://hub.docker.com/r/kamon/grafana_graphite/)
Docker image, and I realised you can actually quite simply write counters, 
gauges and timers to StatsD using nothing but the standard Linux tools `nc` and
`cron`.

For example, every minute on each server being monitored, a simple `cron` job 
is executed which uses `nc` to write a bunch of information to my StatsD 
service:

```sh
#!/bin/bash

HOST=$(hostname)

STAT_HOST="statsd-host"
STAT_PORT=8215

# load average
echo "load.$HOST.avg:`cat /proc/loadavg | cut -d ' ' -f 1 | awk '{print $1*100}'`|g" | nc -w 1 -u $STAT_HOST $STAT_PORT

# memory
echo "memory.$HOST.perc.free:`free | grep Mem | awk '{print $3/$2 * 100.0}'`|g" | nc -w 1 -u $STAT_HOST $STAT_PORT
echo "memory.$HOST.bytes.total:`free -b | grep Mem | awk '{print $2}'`|g" | nc -w 1 -u $STAT_HOST $STAT_PORT
echo "memory.$HOST.bytes.used:`free -b | grep Mem | awk '{print $3}'`|g" | nc -w 1 -u  $STAT_HOST $STAT_PORT

# disk
echo "disk.$HOST.kbytes.total:`df -k --output=size / | grep -v [a-z]`|g" | nc -w 1 -u $STAT_HOST $STAT_PORT
echo "disk.$HOST.kbytes.used:`df -k --output=used / | grep -v [a-z]`|g" | nc -w 1 -u $STAT_HOST $STAT_PORT
echo "disk.$HOST.kbytes.avail:`df -k --output=avail / | grep -v [a-z]`|g" | nc -w 1 -u $STAT_HOST $STAT_PORT

# mail queues
for i in maildrop hold incoming active deferred bounce; do echo "postfix.$HOST.queues.${i}:`find /var/spool/postfix/${i} -type f | wc -l`|c"; done | nc -w 1 -u $STAT_HOST $STAT_PORT
```

It's perhaps a bit inefficient in places, but gets the job done fairly well.
One minute resolution may be a bit rough, but it's sufficient for most of these
data points which don't change too dramatically over time. 

Some other more specific variations include HTTP accesses, ping times, etc. 
Pretty much any parameter you can parse down to a single number can be 
published as a counter, gauge or timer to StatsD, and then neatly 
graphed over time.
