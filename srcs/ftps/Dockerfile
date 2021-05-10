FROM alpine:3.12

#update and upgrade alpine
RUN apk update && apk upgrade

#install apps
RUN apk add vim libc6-compat supervisor vsftpd openssl telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN mkdir -p /var/ftp

#openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21moscow/CN=omillan" -newkey rsa:2048 -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt

#add configs
COPY ./supervisord.conf		/etc/
COPY ./telegraf.conf		/etc/telegraf/
COPY ./vsftpd.conf			/etc/vsftpd/

#add user
#RUN { echo "password"; echo "password"; } | adduser user
RUN adduser -D -g 'omillan' omillan
RUN echo "omillan:pass" | chpasswd

#open ports
EXPOSE 21 21000

#add script to start services
COPY ./start_services.sh	/
CMD /start_services.sh