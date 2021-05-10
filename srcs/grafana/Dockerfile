FROM alpine:3.12

#update and upgrade alpine
RUN apk update && apk upgrade

#install apps
RUN apk add vim libc6-compat supervisor telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted

#grafana
#RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
ADD https://dl.grafana.com/oss/release/grafana-7.5.5.linux-amd64.tar.gz /
RUN tar -zxvf grafana-7.5.5.linux-amd64.tar.gz --strip-components=1 -C / && rm grafana-7.5.5.linux-amd64.tar.gz

#configs
COPY ./supervisord.conf 	/etc/
COPY ./telegraf.conf		/etc/telegraf/

#database
#COPY ./grafana.db 			./grafana-7.5.5/data/

#RUN mkdir -p	/run/telegraf

#port
EXPOSE 3000

#script to start
COPY ./start_services.sh 	/
CMD /start_services.sh