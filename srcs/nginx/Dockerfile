FROM alpine:3.12

RUN apk update && apk upgrade 
RUN apk add nginx vim openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21moscow/CN=omillan" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY ./nginx.conf			/etc/nginx/conf.d/default.conf
COPY ./start_services.sh	/tmp/
COPY ./favicon.ico 	/var/lib/nginx/html/

EXPOSE 80 443
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./telegraf.conf	/etc/telegraf/
RUN chmod +x	/tmp/start_services.sh
RUN mkdir -p	/run/nginx

CMD ["/tmp/start_services.sh"]