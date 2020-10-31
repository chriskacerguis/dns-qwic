FROM golang:1.15-buster

RUN git clone https://github.com/AdguardTeam/dnsproxy.git

RUN cd dnsproxy && go build -mod=vendor

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh /
CMD ["docker-entrypoint.sh"]
