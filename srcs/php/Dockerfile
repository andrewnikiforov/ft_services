FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx vim php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
ADD https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz /var/www
RUN cd /var/www && tar zxvf phpMyAdmin-5.1.0-english.tar.gz && rm phpMyAdmin-5.1.0-english.tar.gz && mv phpMyAdmin-5.1.0-english phpmyadmin
RUN chmod -R 777 /var/www/phpmyadmin

COPY ./index.php			/var/www/phpmyadmin
COPY ./start_services.sh	/tmp/
COPY ./nginx.conf			/etc/nginx/conf.d/default.conf


EXPOSE 5000

RUN chmod +x	/tmp/start_services.sh
RUN mkdir -p	/run/nginx
RUN mkdir -p	/run/php
CMD ["/tmp/start_services.sh"]