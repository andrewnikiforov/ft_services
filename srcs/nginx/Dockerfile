FROM alpine:3.12

RUN apk update && apk upgrade 
RUN apk add nginx openssl vim

COPY ./nginx.conf			/etc/nginx/conf.d/default.conf
COPY ./start_services.sh	/tmp/
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21moscow/CN=omillan" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 80 443

RUN chmod +x	/tmp/start_services.sh
RUN mkdir -p	/run/nginx
CMD ["/tmp/start_services.sh"]
