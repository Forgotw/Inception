FROM debian:bookworm

RUN apt update && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y
RUN rm -f /etc/mysql/my.cnf /etc/my.cnf ~/my.cnf

COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/my.cnf /etc/my.cnf
COPY conf/my.cnf ~/my.cnf

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql /var/lib/mysql && chmod 777 /var/lib/mysql

COPY conf/setup_wp_db.sh /bin
RUN chmod +x /bin/setup_wp_db.sh
EXPOSE 3306

CMD [ "setup_wp_db.sh"]
