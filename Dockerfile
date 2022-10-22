FROM alpine:edge

# Install openvpn
RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add bash curl ip6tables iptables openvpn \
                shadow tini tzdata tcpdump knot-resolver python3 supervisor ferm && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing py3-dnslib && \
    rm -rf /tmp/*

COPY conf/supervisord.conf /etc/supervisor/
COPY conf/ferm.conf /etc/ferm/
COPY conf/k*.conf /etc/knot-resolver/
COPY scripts/init.sh /
COPY dnsmap/* /usr/local/bin/

ENTRYPOINT ["/init.sh"]