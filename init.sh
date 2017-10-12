#!/usr/bin/env bash
pip3 install virtualenv --user
virtualenv -p python3 env --no-site-packages
source env/bin/activate
pip install -r requirements.txt
sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
sudo /etc/init.d/mysql start
gunicorn -c ./etc/gunicorn-django.conf ask.wsgi:application
