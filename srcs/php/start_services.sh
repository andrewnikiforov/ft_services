#!/bin/sh
#php-fpm7
#telegraf
#nginx -g 'daemon off;'
supervisord -c /etc/supervisord.conf
