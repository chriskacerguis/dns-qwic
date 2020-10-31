FROM golang:1.15-buster

WORKDIR /usr/local

RUN git clone https://github.com/AdguardTeam/dnsproxy.git

RUN cd /usr/local/dnsproxy && go build -mod=vendor

EXPOSE 80
EXPOSE 443
EXPOSE 784
EXPOSE 853

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh && ln -s /usr/local/bin/docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]