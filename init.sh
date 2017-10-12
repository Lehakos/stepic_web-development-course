#!/usr/bin/env bash
source env/bin/activate
sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
sudo /etc/init.d/mysql start
gunicorn -c ./etc/gunicorn-django.conf ask.wsgi:application
