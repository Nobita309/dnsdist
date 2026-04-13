FROM alpine:latest

RUN apk add --no-cache --update \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    dnsdist \
    iproute2 \
    tini \
    curl

RUN mkdir -p /etc/dnsdist \
 && chown -R dnsdist /etc/dnsdist

EXPOSE 53/udp 53/tcp

WORKDIR /etc/dnsdist

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "/usr/local/bin/dnsdist.sh"]
