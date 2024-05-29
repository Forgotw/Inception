FROM debian:bookworm

RUN apt update && apt upgrade -y
RUN apt install wget mariadb-client php8.2 php-fpm php-cgi php-mysql -y

COPY conf/setup_wp.sh /bin
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN chmod +x /bin/setup_wp.sh
# RUN touch /run/php/php8.2-fpm.sock

EXPOSE 9000

ENTRYPOINT [ "setup_wp.sh"]

CMD [ "php-fpm8.2", "--nodaemonize"]