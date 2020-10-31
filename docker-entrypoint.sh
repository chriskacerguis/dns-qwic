#!/bin/bash

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
-subj "/C=US/ST=Texas/L=Austin/O=Plainrock/CN=dns01.plainrock.com" \
-keyout /etc/ssl/certs/dns01.plainrock.com.key -out /etc/ssl/certs/dns01.plainrock.com.crt

dnsproxy --quic-port=784 \
-u 8.8.8.8 \
-u 1.1.1.1 \
--cache \
--cache-min-ttl=600 \
--fastest-addr \
--tls-crt=example.crt \
--tls-key=example.key \
-p 0
