FROM alpine:latest

RUN apk add --no-cache dnsdist iproute2 tini

RUN mkdir -p /etc/dnsdist \
 && chown -R dnsdist /etc/dnsdist

EXPOSE 53/udp 53/tcp

WORKDIR /etc/dnsdist

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/local/bin/dnsdist.sh"]
