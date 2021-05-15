FROM alpine:3.12

#update and upgrade alpine
RUN apk update && apk upgrade

#add apps
RUN apk add supervisor\
			influxdb\
			libc6-compat

#telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY ./telegraf.conf		/etc/telegraf/
# ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz /
# RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
# RUN rm telegraf-1.17.0_linux_amd64.tar.gz
# COPY ./telegraf.conf /etc/telegraf/

#-----------------------------


# Setup supervisord.conf for supervisord.

COPY ./supervisord.conf /etc/
COPY ./start_services.sh /

#-----------------------------

# Open ports

EXPOSE 8086

#-----------------------------

# Final command

CMD /start_services.sh

#-----------------------------