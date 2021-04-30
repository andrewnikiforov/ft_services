FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx vim php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

ADD https://wordpress.org/latest.tar.gz /var/www
RUN cd /var/www && tar zxvf latest.tar.gz && rm -rf latest.tar.gz
RUN chmod -R 777 /var/www/wordpress

COPY ./nginx.conf			/etc/nginx/conf.d/default.conf
COPY ./start_services.sh	/tmp/
COPY ./wp-conf.php			/var/www/wordpress
COPY ./index.php			/var/www/wordpress

EXPOSE 5050

RUN chmod +x	/tmp/start_services.sh
RUN mkdir -p	/run/nginx
RUN mkdir -p	/run/wordpress
CMD ["/tmp/start_services.sh"]