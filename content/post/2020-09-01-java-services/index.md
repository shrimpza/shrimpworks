---
published: true
title: Run Your Java Services with SystemD 
date: '2020-09-01'
categories:
- Development
tags:
- Java
- Service
- Linux
split: true
---

There's a strong tendency to want to run everything in Docker these days, 
especially if you're trying to run something as an always-on service, since
passing  `--restart=always` to your `run` invocation or Docker Compose 
configuration ensures that running containers start back up after reboots or
failures, and seems to involve a little less "black magic" than actually 
configuring software to run as services directly on a host.

The downside to this is the approach is that running a service in a container
leads to significantly longer startup times, more memory and CPU overhead, lost
logs, and in my opinion offer a false sense of security and isolation since 
most images are still configured to run as root, and more often than not large
swathes of the host filesystem are mounted as volumes to achieve simple tasks.

There's also a belief that your software will magically run anywhere - but if
you're writing Java (or any JVM language) code - that's one of Java's biggest
selling points - it already has its own VM your code is running in, no most 
platforms!

Therefore, let's see how easy it actually is to configure our software to run 
as a standard system service, providing us with the ability to run it as a 
separate restricted user, complete with standard logging configuration, and
give us control over via standard `service myservice start|status|restart|stop`
commands.

<!--more-->

For the below, I'm assuming we're on a modern Debian-like Linux. Although I
describe and refer to deploying Java services here, the same process can be 
used for any binary which runs on your target infrastructure.

### Create a dedicated user

We'll create a user to run our service as, so it can't tamper with system-owned 
resources, and its own configuration may remain private. We're creating a 
dedicated group, as well as user which cannot log in with a valid shell, named
`svcuser`.

```sh
$ sudo groupadd -r svcuser
$ sudo useradd -r -s /bin/false -g svcuser svcuser
```

### Deploy software to server

Let's copy our service binaries to the server, and make sure they're owned by
the new user. I like to install these services under `/opt/`.

```sh
$ sudo mkdir /opt/myservice
# put your jar files, libraries, or whatever into /opt/myservice
$ sudo chown -R svcuser:svcuser /opt/myservice
```

### Create configuration

If you're migrating from Docker or Docker Compose, you likely have your service
configured via environment variables. We can continue using these via an 
`EnvironmentFile`, or you can create a configuration file if your service
supports reading one.

As such, this step will vary depending on your service implementation.

If you're using environment variables, define an `EnvironmentFile` in the 
following format:

```ini
OPTION=value
SOME_OTHER_OPTION=another_value
```

If your configuration file contains sensitive information, you may restrict it 
to being read by the service only, via the following, which will ensure it's
only readable by `root` and the `svcuser` user:

```sh
$ sudo chown svcuser /etc/myservice/config.env
$ sudo chmod 0640 /etc/myservice/config.env
```

### Define the SystemD service

```ini
[Unit]
Description=My Service
After=syslog.target
After=network.target
   
[Service]
WorkingDirectory=/opt/myservice/
ExecStart=/usr/bin/java -jar /opt/myservice/myservice.jar
EnvironmentFile=/etc/myservice/config.env
User=svcuser
Type=simple
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=myservice
SuccessExitStatus=0
TimeoutStopSec=120
Restart=always
   
[Install]
WantedBy=multi-user.target
```

Note the `EnvironmentFile` is only needed if your config is defined using 
environment variables.

Then, tell `systemd` about our new service:

```sh
$ sudo systemctl daemon-reload
```

It's important to remember to do the above `reload` whenever making changes to
a service definition.

### Configure Logging

You'll see above that we configured output to be written to `syslog`, and that
we defined a `SyslogIdentifier` with a unique name for our service.

With this configuration, we can configure `rsyslog` to write logs to our own 
log file. 

```sh
$ sudo vim /etc/rsyslog.d/myservice.conf
```

Add the following to the above configuration file. In this case `$programname`
corresponds to the `SyslogIdentifier` we configured in the service, so any
logging will be redirected to it's own log file.

```
if $programname == 'myservice' then /var/log/myservice.log
& stop
```

Prepare log file permissions:

```sh
$ sudo touch /var/log/myservice.log
$ sudo chown svcuser:svcuser /var/log/myservice.log
```

Restart `rsyslog` with the updated configuration:

```sh
$ sudo service rsyslog restart
```

If your service generates a lot of logs, log roation could also be configured
at this point, by placing an entry in `/etc/logrotate.d/`. Refer to the other
configuration files in that directory to get a sense of how they work.

### Start it up!

You can now control your service:

```sh
$ sudo service myservice start
$ sudo service myservice status
```

You can also inspect or follow its logs:

```sh
$ sudo tail -f /var/log/myservice.log
```

### Conclusion

The above likely seems to be a rather lengthy process as I've laid it out, but
it's probably 5-10 minutes "work" in total, and you get a result much better 
integrated into the host system, easily manageable logs, plus it's easier to
monitor, manage and debug - especially for services you're developing and would
like to know more about how it's behaving, without the complexity of additional
layers between you and your code.
