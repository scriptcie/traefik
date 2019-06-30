#!/usr/bin/env bash

mkdir certs
 
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout cert.key -out cert.crt
# 
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout cerst/cert.key -out cerst/cert.crt -subj "/C=NL/ST=Groningen/L=Groningen/O=francken/OU=compucie/CN=*.localhost.nl"
