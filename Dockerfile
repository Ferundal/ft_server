FROM debian:buster

LABEL maintainer cjettie <cjettie@student.21-school.ru>
RUN apt-get update -y && \
	apt-get	upgrade -y

RUN apt-get install -y nginx
RUN apt install mariadb-server -y
RUN apt-get install php php-fpm php-mysql -y
RUN apt-get install -y wget
RUN apt-get install -y vim

RUN wget -c https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz && tar -xzf phpMyAdmin-5.1.0-all-languages.tar.gz

# переместить распакованный phpmyadmin в папку рута на сервере и назвать поприличнее
#переместить готовый конфиг в предыдущую папку с  php

#написать конфиг для nginx
#переместить его в ту папку где должен быть конфиг для nginx

#также wgetом установить вордпресс распокавать и положить папку в папку с рутом nginxa
#переместить готовый конфиг в предыдущую папку с  wp

# поебаться с марией

#написать скрипт запуска, где буудт запусктаься все сервисы
# перемаестить его в контейнер


COPY ./srcs/start_serv.sh /tmp/
#RUN chmod +x /tmp/start_serv.sh

EXPOSE 80 443
CMD ["/tmp/start_serv.sh"]





