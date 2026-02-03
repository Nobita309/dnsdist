FROM alpine:latest

RUN apk add --no-cache \
    dnsdist \
    iproute2 \
    tini

RUN adduser -D -u 953 dnsdist \
 && mkdir -p /etc/dnsdist \
 && chown -R dnsdist /etc/dnsdist

EXPOSE 53/udp 53/tcp

USER dnsdist
WORKDIR /etc/dnsdist

ENTRYPOINT ["/sbin/tini","--","/usr/local/bin/dnsdist.sh"]
