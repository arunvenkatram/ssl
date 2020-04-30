sudo yum install epel-release -y
sudo yum install nginx -y
sudo mkdir /etc/ssl/private
sudo chmod 700 /etc/ssl/private
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=IN/ST=Karnataka/L=Bangalore/O=Thoughtworks/OU=LeavePlanner/CN=34.93.219.254"
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
sudo gsutil cp /etc/nginx/conf.d/ssl.conf /etc/nginx/conf.d/ssl.conf
sudo systemctl restart nginx
