FROM php:5.6-apache

RUN apt update && \
	env DEBIAN_FRONTEND=noninteractive apt -y install wget libcurl4-openssl-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev && \
	docker-php-ext-install sockets curl mysql mbstring && \
	docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
	docker-php-ext-install gd

COPY . /defaults
#RUN chmod -R 777 gamedata && \
#	chmod -R 777 include && \
#	chmod -R 777 templates

EXPOSE 80
WORKDIR /var/www/html

ENV DTS_DB_HOST mysql
ENV DTS_DB_USER dts
ENV DTS_DB_PASSWORD qweqwe
ENV DTS_DB_NAME dts
ENV DTS_DB_REPORT 1
# ENV DTS_COOKIE_DOMAIN
ENV DTS_COOKIE_PATH /
ENV DTS_HEADER_CHARSET 0
ENV DTS_PCONNECT true
ENV DTS_GAME_FOUNDER Nanahira
ENV DTS_POST_INTERVAL 1
ENV DTS_MOVE_UT 8
ENV DTS_MOVE_UT_MINUTE 0
ENV DTS_TABLE_PRE dts_
ENV DTS_AUTH_KEY qweqwe
ENV DTS_BBS_URL http://76573.org/
ENV DTS_GAME_URL http://dts.moe/
ENV DTS_HOME_PAGE http://www.amarilloviridian.com/
ENV DTS_TITLE "Acfun DTS"
ENV DTS_ERROR_INFO 0

CMD /defaults/docker-entrypoint.sh
