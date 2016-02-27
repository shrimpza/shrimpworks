---
layout: post
status: publish
published: true
title: User Directories and PHP with nginx
date: '2015-04-25 08:53:16 +0200'
categories:
- Development
- Linux
tags:
- PHP
- Debian
- Linux
- nginx
---

I've become fond of using nginx on my development machines, rather than
a full Apache.

There are no explicit options built-in which allow something along the
same lines as Apache's \`userdir\`, however it's easy enough to tweak
the default configuration to support that behaviour without the need for
external modules.

I also do some PHP dabbling from time to time, so need to enable that as
well.

Install the required bits:

`$ sudo aptitude install nginx php5-fpm`

Configure nginx (the below is my customised and cleaned out `server`
definition):

`/etc/nginx/sites-available/default`

    server {
            listen 80 default_server;
            listen [::]:80 default_server;

            root /var/www/html;

            # Add index.php to the list if you are using PHP
            index index.html index.htm index.nginx-debian.html index.php;

            server_name _;

            # PHP support in user directories
            location ~ ^/~(.+?)(/.*\.php)$ {
                    alias /home/$1/public_html;
                    autoindex on;

                    include snippets/fastcgi-php.conf;

                    try_files $2 = 404;
                    fastcgi_pass unix:/var/run/php5-fpm.sock;
            }

            # PHP support in document root
            location ~ \.php$ {
                    include snippets/fastcgi-php.conf;
                    fastcgi_pass unix:/var/run/php5-fpm.sock;
            }

            # User directories in /home/user/public_html/
            # are accessed via http://host/~user/
            location ~ ^/~(.+?)(/.*)?$ {
                    alias /home/$1/public_html$2;
                    autoindex on;
            }
    }

I also had to make a change to `/etc/nginx/snippets/fastcgi-php.conf`,
to comment out the following line:

    #try_files $fastcgi_script_name =404;

After restarting the nginx service (also make sure the `php5-fpm`
service is running), you will be able to serve HTML and PHP files from
your `~/public_html` directory.
