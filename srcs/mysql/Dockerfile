FROM alpine:3.12

VOLUME ["/var/lib/mysql"]

RUN apk update && apk upgrade
RUN apk add vim openrc mysql mysql-client libc6-compat supervisor

#telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY ./telegraf.conf	/etc/telegraf/


COPY ./start_services.sh	/


COPY ./supervisord.conf 	/etc/
COPY ./create_db.sql 		/
COPY ./wordpress.sql 		/
COPY ./my.cnf 				/etc/

EXPOSE 3306

RUN mkdir -p	/run/mysql

CMD /start_services.sh