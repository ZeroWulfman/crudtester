echo " ********* Updating Machine..."
apt-get update
apt-get upgrade
echo " ********* Installing Apache2..."
apt-get install -y apache2 apache2-doc apache2-utils
apt-get update
echo " ********* Installing Deb-Config..."
apt-get install debconf-utils -y > /dev/null
apt-get update
debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"
echo " ********* Installing MySQL Server..."
apt-get install -y mysql-server > /dev/null
echo " ********* Installing PHP 5..."
apt-get install -y php5-cli
add-apt-repository ppa:ondrej/php -y
apt-get update
echo " ********* Upgrading PHP to 7.0..."
apt-get install -y php7.0
echo " ********* Final Update..."
apt-get update
apt-get upgrade -y
if ! [ -L /var/www ]; then
    rm -rf /var/www
    ln -fs /vagrant /var/www
fi
echo " ********* Processes Finished..."
