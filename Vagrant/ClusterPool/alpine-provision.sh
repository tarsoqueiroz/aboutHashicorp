#!/usr/bin/env bash

# Update & upgrade instalation
apk update
apk upgrade

# Installing Docker
apk add docker docker-compose
addgroup vagrant docker
rc-update add docker default
rc-service docker restart

# Installing languages & tools
apk add nano
# apk add git
# apk add go python2 nodejs npm 

# if ! [ -L /var/www ]; then
#   rm -rf /var/www
#   ln -fs /vagrant /var/www
# fi
