FROM alpine:3.12

RUN apk update && apk upgrade 
RUN apk add influxdb telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./telegraf.conf	/etc/telegraf/
COPY ./start_services.sh	/tmp

RUN chmod +x	/tmp/start_services.sh

CMD ["/tmp/start_services.sh"]