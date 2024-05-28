#!/bin/sh

echo >> /tmp/init_db_user.sql "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
echo >> /tmp/init_db_user.sql "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS';"
echo >> /tmp/init_db_user.sql "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%';"
echo >> /tmp/init_db_user.sql "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"
echo >> /tmp/init_db_user.sql "FLUSH PRIVILEGES;"

/usr/sbin/mariadbd --user=mysql & sleep 2
/usr/bin/mariadb -h localhost < /tmp/init_db_user.sql

pkill mariadbd
/usr/sbin/mariadbd --user=mysql