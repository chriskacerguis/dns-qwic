# dns-qwic
Docker for a DNS over Qwic server

## Usage

```sh
docker run --name dns-qwic \
--restart always \
-p 784:784/udp \
-p 443:443 \
-p 853:853 \
-p 80:80 \
-d chriskacerguis/dns-qwic
```