FROM alpine:3.12

# udate and upgrade alpine
RUN apk update && apk upgrade

#install nginx and openssl and openssh
RUN apk add nginx vim openssl openssh supervisor


#generate key and certs to ssl an ssh
RUN mkdir -p /etc/nginx/.ssh && mkdir -p /etc/nginx/.ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21moscow/CN=omillan" -newkey rsa:2048 -keyout /etc/nginx/.ssh/nginx-selfsigned.key -out /etc/nginx/.ssl/nginx-selfsigned.crt
RUN ssh-keygen -A

#configfile to nginx
COPY ./nginx.conf			/etc/nginx/conf.d/default.conf

#script that start ssh, nginx and telegraf with supervisor
COPY ./start_services.sh	/
COPY ./supervisord.conf		/etc/

#icon for nginxpage
COPY ./favicon.ico			/var/lib/nginx/html/

#open ports
EXPOSE 80 443 22

#install telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY ./telegraf.conf		/etc/telegraf/

#dir for nginx pid ???
RUN mkdir -p				/run/nginx

#start serveces
CMD /start_services.sh