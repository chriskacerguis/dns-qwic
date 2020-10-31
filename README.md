# dns-qwic
Docker for a DNS over Qwic server

## Usage

```sh
docker run --name dns-qwic \
--restart always \
-v /root/fullchain.crt:/etc/ssl/certs/fullchain.crt \
-v /root/privkey.key:/etc/ssl/certs/privkey.key
-p 784:784/udp \
-p 443:443 \
-p 853:853 \
-p 80:80 \
-d chriskacerguis/dns-qwic
```