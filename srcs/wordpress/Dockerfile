FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx vim php7 php7-fpm php7-mbstring php7-session php7-json php7-mysqli php7-gd php7-xml php7-curl php7-iconv supervisor openssl

#wordpress
ADD https://wordpress.org/latest.tar.gz /var/www
RUN cd /var/www && tar zxvf latest.tar.gz && rm -rf latest.tar.gz && cd wordpress
RUN chmod -R 777 /var/www/wordpress

#telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
COPY ./telegraf.conf	/etc/telegraf/


COPY ./supervisord.conf 	/etc/
COPY ./nginx.conf			/etc/nginx/conf.d/default.conf
COPY ./wp-config.php		/var/www/wordpress

EXPOSE 5050

#???
RUN mkdir -p	/run/nginx
RUN mkdir -p	/run/wordpress


#openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21moscow/CN=omillan" -newkey rsa:2048 -keyout /etc/ssl/private/wp.key -out /etc/ssl/certs/wp.crt


COPY ./start_services.sh	/
CMD /start_services.sh