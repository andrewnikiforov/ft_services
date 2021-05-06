FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vim telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
ADD https://dl.grafana.com/oss/release/grafana-7.5.5.linux-amd64.tar.gz /
RUN tar -zxvf grafana-7.5.5.linux-amd64.tar.gz && rm grafana-7.5.5.linux-amd64.tar.gz

COPY ./telegraf.conf	/etc/telegraf/
COPY ./start_services.sh /tmp/
COPY ./grafana.db ./grafana-7.5.5/data/

RUN chmod +x	/tmp/start_services.sh
#RUN mkdir -p	/run/telegraf

EXPOSE 3000

CMD ["/tmp/start_services.sh"]