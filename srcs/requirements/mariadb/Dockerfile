FROM debian:bookworm

RUN apt update && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y
RUN rm -f /etc/mysql/my.cnf /etc/my.cnf ~/my.cnf

COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/my.cnf /etc/my.cnf
COPY conf/my.cnf ~/my.cnf

CMD [ "tail", "-f"]
