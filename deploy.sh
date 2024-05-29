sudo apt install apache2 apache2-utils libexpat1 python3 python3-dev libapache2-mod-wsgi-py3
cd /var/www/
git clone https://github.com/Dreykovic/ua-app.git
cp ua-app/ua.conf /etc/apache2/sites-available/ua.conf

chown www-data:www-data ua-app/
chown www-data:www-data ua-app/db.sqlite3 
chmod 775 ua-app/
chmod 664 ua-app/db.sqlite3 
apt install python3-venv
apt install python3-tk
cd ua-app/
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt 
a2ensite caert.egotransfert.com.conf 
a2dissite 000-default.conf 
systemctl restart apache2



git pull
cp app.service /etc/systemd/system/caert.service 
systemctl status caert.service 
systemctl stop caert.service 
systemctl daemon-reload
systemctl stop caert.service 
systemctl start caert.service 
systemctl status caert.service 
