# dns-qwic
Docker for a DNS over Qwic server


## Usage

docker run --name dns-qwic \
-p 784:784 \
-p 443:443 \
-p 853:853 \
-p 80:80 \
chriskacerguis/dns-qwic