#!/bin/sh


# echo "mariadb -h mariadb -u $DB_USER --password=$DB_USER_PASS -P 3306 $DB_NAME -v"
# mariadb -h mariadb -u $DB_USER --password=$DB_USER_PASS -P 3306 $DB_NAME -v > marialog.txt
# echo "--------------AFTER--------------"

if [ -f wordpress/wp-config.php ]
then
    echo "OK"
else
    echo "KO"
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
	mv wp-cli.phar /bin/wp	
	cd /var/www/html || exit
    echo "DL"
	wp core download --allow-root
    echo "CONFIG: --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASS"
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASS --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    echo "INSTALL"
	wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root
    echo "USER CREATE"
	wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASS --allow-root
fi

exec "$@"