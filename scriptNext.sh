#!/bin/bash
echo "ATUALIZANDO SERVIDOR LINUX"
sudo apt-get update


echo "INSTALANDO O SERVIDOR WEB....."
sudo apt-get install apache2 -y
sudo apt-get install php zip libapache2-mod-php php-gd php-json php-mysql php-curl php-mbstring php-intl php-imagick php-xml php-zip php-mysql -y



echo "BAIXANDO NEXTCLOUD....SEMPRE VERIFIQUE A VERSÃO"
cd /tmp
wget https://download.nextcloud.com/server/prereleases/nextcloud-25.0.0rc3.zip
sudo unzip nextcloud*.zip

echo "INSTALANDO NEXTCLOUD"
sudo mv nextcloud/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
cd /

echo "INICIANO O ISTEMA"
sudo a2enmod rewrite headers env dir mime
sudo sed -i '/^memory_limit =/s/=.*/= 512M/' /etc/php/7.4/apache2/php.ini
sudo systemctl restart apache2