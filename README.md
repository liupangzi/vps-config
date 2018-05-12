# Checkout code && config
```bash
# mkdir -p /var/www
# git clone git@github.com:liupangzi/liuchao.me.git /var/www/liuchao.me
# git clone git@github.com:liupangzi/vps-config.git /root/vps-config
# chown -R www-data:www-data /var/www/*
```

# OS
```bash
# rm /etc/sysctl.conf && ln -s /root/vps-config/os/sysctl.conf /etc/sysctl.conf
# rm /root/.bashrc && ln -s /root/vps-config/os/dotbashrc /root/.bashrc && source /root/.bashrc
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
# apt update && apt upgrade
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
# apt update -y
# apt install -y redis-server
```

- Update `/etc/redis/redis.conf`:
<pre>
bind bind 127.0.0.1 <del>::1</del>
</pre>

- Restart Redis:
```bash
# /etc/init.d/redis-server restart
```

# Letsencrypt
```bash
# git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
# /opt/letsencrypt/letsencrypt-auto certonly \
    --text \
    --agree-tos \
    --quiet \
    --non-interactive \
    --authenticator standalone \
    --renew-by-default \
    --rsa-key-size 4096 \
    --email thesedays@126.com \
    --hsts \
    -d liuchao.me \
    -d www.liuchao.me \
    -d 404.liuchao.me \
    -d blog.liuchao.me \
    -d tech.liuchao.me

# /opt/letsencrypt/letsencrypt-auto certonly \
    --text \
    --agree-tos \
    --quiet \
    --non-interactive \
    --authenticator standalone \
    --renew-by-default \
    --rsa-key-size 4096 \
    --email thesedays@126.com \
    --hsts \
    -d 718281828459045235.com \
    -d 2.718281828459045235.com

# openssl dhparam -out /etc/letsencrypt/dhparams.pem 4096
```

# Openresty

- Install Openresty
```bash
# wget -qO - https://openresty.org/package/pubkey.gpg | apt-key add -
# apt -y install software-properties-common
# add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"
# apt update -y
# apt install -y openresty
```

- Update conf
```bash
# cd /usr/local/openresty/nginx/conf
# rm nginx.conf && ln -s /root/vps-config/openresty/conf/nginx.conf nginx.conf
# ln -s /root/vps-config/openresty/conf/servers servers
```

- Restart Openresty:
```bash
# /etc/init.d/openresty restart
```
