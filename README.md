# Checkout code && config
```bash
mkdir -p /var/www
git clone git@github.com:liupangzi/liuchao.me.git /var/www/liuchao.me
git clone git@github.com:liupangzi/vps-config.git /root/vps-config
chown -R www-data:www-data /var/www/*
```

# OS
```bash
ln -s /root/vps-config/os/dotgitconfig /root/.gitconfig
```

# MySQL

- Install MySQL server:
```bash
apt install -y default-mysql-server
mysql_secure_installation
> root / root
systemctl restart mariadb
systemctl status mariadb
```

# PostgreSQL
```bash
apt update && sudo apt upgrade
apt install -y curl apt-transport-https
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /usr/share/keyrings/postgresql-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/postgresql-keyring.gpg] http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list
apt update
apt install -y postgresql-13
systemctl restart postgresql
systemctl status postgresql
```

# PHP

- Install PHP 7.4
```bash
apt -y install lsb-release apt-transport-https ca-certificates wget
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
apt update && apt upgrade -y
apt install -y php7.4-xml php7.4-mbstring php7.4-zip php7.4-mysql php7.4 php7.4-opcache php7.4-curl php7.4-bz2 php7.4-cgi php7.4-cli php7.4-fpm php7.4-gmp php7.4-common php7.4-bcmath php7.4-gd php7.4-intl php-imagick
update-alternatives --set php /usr/bin/php7.4
```

- Edit `/etc/php/7.4/fpm/pool.d/www.conf` to change PHP-FPM from listening on unix socket to listening on TCP/IP port:
```bash
- listen = /run/php/php7.4-fpm.sock
+ listen = 127.0.0.1:9000
``` 

- Start PHP-FPM
```bash
systemctl restart php7.4-fpm
systemctl status php7.4-fpm
```

# Redis

- Install Redis
```bash
apt update
apt install -y redis-server
```

- Update `/etc/redis/redis.conf`:
<pre>
bind 127.0.0.1 <del>::1</del>
</pre>

- Restart Redis:
```bash
systemctl restart redis
systemctl status redis
```

# Nginx

- Install Nginx
```bash
apt install -y nginx
```

- Update conf
```bash
cd /etc/nginx
mv nginx.conf nginx.conf.back && ln -s /root/vps-config/nginx/conf/nginx.conf nginx.conf
ln -s /root/vps-config/nginx/conf/servers servers
```

- Restart Nginx:
```bash
systemctl restart nginx
systemctl status nginx
```

# Tiny Tiny RSS
```bash
# crontab:
sudo -u www-data /usr/bin/php /var/www/liuchao.me/rss/update.php --feeds
```
