FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vim telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY ./start_services.sh /tmp/

RUN { echo "password"; echo "password"; } | adduser user

EXPOSE 21 21000
RUN chmod +x	/tmp/start_services.sh
CMD ["/tmp/start_services.sh"]