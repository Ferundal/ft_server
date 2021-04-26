FROM debian:buster

# LABEL maintainer cjettie <cjettie@student.21-school.ru>
RUN apt-get update -y && \
	apt-get	upgrade -y

RUN apt-get install -y nginx
RUN apt-get install mariadb-server -y
RUN apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring php-xml

RUN apt-get install -y wget
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/OU=7wave/CN=cjettie" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

RUN apt-get install -y vim

RUN mkdir -p /var/www/localhost/html

RUN wget -c https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz && \
    tar -xzf phpMyAdmin-5.1.0-all-languages.tar.gz && \
    rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz && \
    mv phpMyAdmin-5.1.0-all-languages ./var/www/localhost/html/phpmyadmin

COPY ./srcs/config.inc.php ./var/www/localhost/html/phpmyadmin

RUN wget -c https://ru.wordpress.org/latest-ru_RU.tar.gz && \
    tar -xzf latest-ru_RU.tar.gz && \
    rm -rf latest-ru_RU.tar.gz && \
    mv wordpress ./var/www/localhost/html/wordpress

COPY ./srcs/wp-config.php ./var/www/localhost/html/wordpress
COPY ./srcs/autoindex.sh .

COPY ./srcs/start_serv.sh .
COPY ./srcs/localhost /etc/nginx/sites-available/

RUN chmod +x start_serv.sh && \
    ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

RUN chown -R www-data:www-data /var/www/localhost/html
RUN chmod -R 755 /var/www/localhost/html

EXPOSE 80 443
CMD ["./start_serv.sh"]





