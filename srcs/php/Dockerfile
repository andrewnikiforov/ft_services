FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add openssl nginx vim php7-fpm php7-mbstring php7-session php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21moscow/CN=omillan" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

ADD https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz /var/www

RUN cd /var/www && tar zxvf phpMyAdmin-5.1.0-english.tar.gz && rm phpMyAdmin-5.1.0-english.tar.gz && mv phpMyAdmin-5.1.0-english phpmyadmin && cd phpmyadmin 
RUN chmod -R 777 /var/www/phpmyadmin
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./telegraf.conf	/etc/telegraf/
COPY ./nginx.conf			/etc/nginx/conf.d/default.conf
#COPY ./index.php			/var/www/phpmyadmin
COPY ./start_services.sh	/tmp/

EXPOSE 5000

RUN chmod +x	/tmp/start_services.sh
RUN mkdir -p	/run/nginx
RUN mkdir -p	/run/php
CMD ["/tmp/start_services.sh"]