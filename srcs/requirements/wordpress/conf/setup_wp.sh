#!/bin/sh

mariadb -u $DB_USER --password=$DB_USER_PASS -P 3306 $DB_NAME

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
	wp core download --allow-root
	wp config create --dbname=$WB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASS --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=lsohler.42.fr --title=wordpress_title --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root
	wp user create $WORDPRESS_DB_USER $WORDPRESS_DB_MAIL --role=author --user_pass=$WORDPRESS_DB_PASSWORD --allow-root
	echo "Done setting up" >> my_bashLog.txt
    
fi