#!/bin/bash

wget https://github.com/chamilo/chamilo-lms/releases/download/v1.10.8/chamilo-lms-1.10.8.tar.gz
tar xvf chamilo-lms-1.10.8.tar.gz
rm chamilo-lms-1.10.8.tar.gz
cd ./dockerimage
docker build -t 'opsforge/chamilo:latest' .
cd ..
docker-compose up -d

echo ""
echo "Chamilio on Docker successfully set up"
echo ""
