# Checkout code && config
```bash
# mkdir -p /var/www
# git clone git@github.com:liupangzi/liuchao.me.git /var/www/liuchao.me
# git clone git@github.com:liupangzi/vps-config.git /root/vps-config
# chown -R www-data:www-data /var/www/*
```

# OS
```bash
# ln -s /root/vps-config/os/dotgitconfig /root/.gitconfig
```

# MySQL

- Install MySQL server:
```bash
# apt install -y mysql-server

# mysql_secure_installation
> root / root

# /etc/init.d/mysql restart
```

- Recover from backups:
```
# mysql -uroot -p < /root/vps-config/mysql/liuchao.me.sql
```

# PHP

- Install PHP 7.2
```bash
# add-apt-repository -y ppa:ondrej/php
# apt update && apt upgrade -y
# apt install -y php7.2-xml php7.2-mbstring php7.2-zip php7.2-mysql php7.2 php7.2-opcache php7.2-json php7.2-xmlrpc php7.2-curl php7.2-bz2 php7.2-cgi php7.2-cli php7.2-fpm php7.2-gmp php7.2-common php7.2-bcmath php7.2-gd
# update-alternatives --set php /usr/bin/php7.2
```

- Edit `/etc/php/7.2/fpm/pool.d/www.conf` to change PHP-FPM from listening on unix socket to listening on TCP/IP port:
```bash
- listen = /run/php/php7.1-fpm.sock
+ listen = 127.0.0.1:9000
``` 

- Start PHP-FPM
```bash
# /etc/init.d/php7.2-fpm start
```

# Redis

- Install Redis
```bash
# add-apt-repository ppa:chris-lea/redis-server
# apt update
# apt install -y redis-server
```

- Update `/etc/redis/redis.conf`:
<pre>
bind 127.0.0.1 <del>::1</del>
</pre>

- Restart Redis:
```bash
# /etc/init.d/redis-server restart
```

# Letsencrypt
```bash
# git clone https://github.com/certbot/certbot /opt/certbot

# /opt/certbot/certbot-auto certonly --manual -d *.718281828459045235.com -d 718281828459045235.com --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
# /opt/certbot/certbot-auto certonly --manual -d *.chaos.plus -d chaos.plus --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
# /opt/certbot/certbot-auto certonly --manual -d *.liuchao.me -d liuchao.me --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
# openssl dhparam -out /etc/letsencrypt/dhparams.pem 4096
```

# Nginx

- Install Nginx
```bash
# apt install -y nginx
```

- Update conf
```bash
# cd /etc/nginx
# mv nginx.conf nginx.conf.back && ln -s /root/vps-config/openresty/conf/nginx.conf nginx.conf
# ln -s /root/vps-config/openresty/conf/servers servers
```

- Restart Openresty:
```bash
# /etc/init.d/openresty restart
```
