FROM debian:bookworm

RUN apt update && apt upgrade -y
RUN apt install wget mariadb-client php8.2 php-fpm php-cgi -y

COPY conf/setup_wp.sh /bin
RUN chmod +x /bin/setup_wp.sh

ENTRYPOINT [ "setup_wp.sh"]
CMD [ "tail", "-f"]