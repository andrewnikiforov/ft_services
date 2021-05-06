FROM alpine:3.12

VOLUME ["/var/lib/mysql"]

RUN apk update && apk upgrade
RUN apk add vim openrc mysql mysql-client libc6-compat supervisor
					#&& addgroup mysql mysql
					#mkdir run/mysqld && \
					#chown -R mysql:mysql /var/run/mysqld/* && \
					#chmod -R 644 /var/run/mysqld/mysqld.sock
	#				mkfifo /run/mysqld/mysqld.sock && \
	#				touch /run/mysqld/mysqld.pid

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY ./telegraf.conf	/etc/telegraf/


COPY ./start_services.sh	/tmp/
RUN chmod +x	/tmp/start_services.sh


COPY ./supervisord.conf /etc/
COPY ./create_db.sql /
COPY ./mysql-service.sql /
COPY ./my.cnf /etc/

EXPOSE 3306

CMD ["/tmp/start_services.sh"]