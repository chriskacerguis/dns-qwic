#!/bin/bash


if [ ! -f /etc/ssl/certs/privkey.key ]; then
  openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
  -subj "/C=US/ST=Texas/L=Austin/O=Plainrock/CN=dns01.plainrock.com" \
  -keyout /etc/ssl/certs/privkey.key -out /etc/ssl/certs/fullchain.crt
fi

/usr/local/dnsproxy/dnsproxy \
--quic-port=784 \
--https-port=443 \
--tls-port=853 \
-u 8.8.8.8 \
-u 1.1.1.1 \
--cache \
--cache-min-ttl=600 \
--fastest-addr \
--refuse-any \
--tls-crt=/etc/ssl/certs/fullchain.crt \
--tls-key=/etc/ssl/certs/privkey.key \
-p 0