FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add openssl nginx vim php7 php7-fpm php7-mbstring php7-session php7-json php7-mysqli php7-gd php7-xml php7-curl php7-iconv
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21moscow/CN=omillan" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

#phpmyadmin
ADD https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz /var/www
RUN cd /var/www && tar zxvf phpMyAdmin-5.1.0-english.tar.gz && rm phpMyAdmin-5.1.0-english.tar.gz && mv phpMyAdmin-5.1.0-english phpmyadmin && cd phpmyadmin 
RUN chmod -R 777 /var/www/phpmyadmin

#telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
COPY ./telegraf.conf	/etc/telegraf/

COPY ./nginx.conf			/etc/nginx/conf.d/default.conf
COPY ./start_services.sh	/tmp/
COPY ./config.inc.php 		/var/www/phpmyadmin

EXPOSE 5000

RUN chmod +x	/tmp/start_services.sh
RUN mkdir -p	/run/nginx
RUN mkdir -p	/run/php
CMD ["/tmp/start_services.sh"]