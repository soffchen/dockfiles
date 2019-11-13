#!/bin/sh

unzip -qo /tmp/h5ai.zip -d /h5ai/

if [ -f "/options.json" ]; then
    cp /options.json /h5ai/_h5ai/private/conf/
fi

chown -R apache:apache /h5ai/
chmod -R 777 /h5ai/_h5ai/private/cache/
chmod -R 777 /h5ai/_h5ai/public/cache/

echo "DirectoryIndex /_h5ai/public/index.php" >> /h5ai/.htaccess 
echo "ServerName localhost" >> /etc/apache2/httpd.conf

sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf
sed -i "/mod_rewrite.so/s/#LoadModule/LoadModule/" /etc/apache2/httpd.conf
sed -i "s/\/var\/www\/localhost\/htdocs/\/h5ai/" /etc/apache2/httpd.conf

rm -rf /tmp/*

/usr/sbin/httpd -D FOREGROUND
