FROM debian:bookworm

RUN apt update && apt upgrade -y
RUN apt install nginx openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/ssl/certs/lsohler.crt \
    -keyout /etc/ssl/certs/lsohler.key \
    -subj "/C=CH/ST=Vaud/L=Renens/O=42Lausanne/OU=lsohler/CN=lsohler.42.fr"

RUN chmod 644 /etc/ssl/certs/lsohler.crt
RUN chmod 600 /etc/ssl/certs/lsohler.key

COPY ./conf/nginx.conf /etc/nginx/conf.d/lsohler.42.fr.conf

EXPOSE 443
EXPOSE 80

# RUN nginx -t
CMD [ "nginx", "-g", "daemon off;"]