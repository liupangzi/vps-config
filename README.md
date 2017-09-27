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

- Follow [this instruction](https://www.percona.com/doc/percona-server/LATEST/installation/apt_repo.html#installing-percona-server-on-debian-and-ubuntu) to install Percona Server.

- Update MySQL:
```
mysql> CREATE DATABASE blog_justice_plus;
mysql> CREATE DATABASE tech_justice_plus;
mysql> ALTER USER 'liuchao'@'%' IDENTIFIED BY 'liuchao';
mysql> GRANT ALL on `blog_liuchao_me`.* to 'liuchao'@'%';
mysql> GRANT ALL on `tech_liuchao_me`.* to 'liuchao'@'%';
mysql> FLUSH PRIVILEGES;
```

- Update `/etc/mysql/percona-server.conf.d/mysqld.cnf`:
<pre>
+ bind-address = <b><i>127.0.0.1</i></b>
</pre>

- Restart Percona Server:
```
# /etc/init.d/mysql restart
```

- Recover from backups:
```
# mysql -uroot < /root/vps-config/mysql/liuchao.me.sql
```

# PHP

- Install PHP 7.1
```bash
# apt install -y python-software-properties
# add-apt-repository -y ppa:ondrej/php
# apt update -y
# apt install -y php7.1-xml php7.1-mbstring php7.1-zip php7.1-mysql php7.1 php7.1-opcache php7.1-json php7.1-xmlrpc php7.1-curl php7.1-bz2 php7.1-cgi php7.1-cli php7.1-fpm php7.1-gmp php7.1-common php7.1-bcmath php7.1-mcrypt php7.1-gd
```

- Edit `/etc/php/7.1/fpm/pool.d/www.conf` to change PHP-FPM from listening on unix socket to listening on TCP/IP port:
```bash
- listen = /run/php/php7.1-fpm.sock
+ listen = 127.0.0.1:9000
``` 

- Start PHP-FPM
```bash
# /etc/init.d/php7.1-fpm start
```

# Redis

- Install Redis
```bash
# apt install -y software-properties-common
# add-apt-repository ppa:chris-lea/redis-server
# apt update -y
# apt install -y redis-server
```

- Update `/etc/redis/redis.conf`:
<pre>
bind <b><i>127.0.0.1</i></b>
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
