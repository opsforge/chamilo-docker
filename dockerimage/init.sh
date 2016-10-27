#!/bin/bash

if [ "$(ls -A /var/www/html)" ]; then
   echo "Chamilo already installed - moving on."
else
   echo "Chamilo not installed - deploying."
   cd /var/www/html
   wget https://github.com/chamilo/chamilo-lms/releases/download/v1.10.8/chamilo-lms-1.10.8.tar.gz
   tar xvf chamilo-lms-1.10.8.tar.gz
   mv chamilo-lms*/* ./
   rm -rf chamilo-lms-1.10.8.tar.gz
   rm -rf chamilo-lms-1.10.8
   sudo chown -R root:root ./
   sudo chmod -R 0777 ./
fi

/bin/bash -c 'a2enmod rewrite; apache2-foreground'
