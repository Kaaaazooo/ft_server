FROM debian:buster

RUN apt-get update && apt-get install -y nginx \
				mariadb-server \
				mariadb-client \ 
				php7.3 \
				php7.3-fpm \
				php7.3-mbstring \
				php7.3-mysql \
				openssl \
				vim

COPY srcs/wordpress /var/www/wordpress
COPY srcs/phpmyadmin /var/www/phpmyadmin

COPY srcs/wp_db.sql .
COPY srcs/nginx.conf /etc/nginx/sites-available/default

RUN service mysql start && cat wp_db.sql | mariadb -u root

COPY srcs/localhost.crt /etc/ssl/certs/localhost.crt
COPY srcs/localhost.key /etc/ssl/private/localhost.key

EXPOSE 80 443

CMD service mysql start && service php7.3-fpm start && \
	service nginx restart && tail -f /dev/null
