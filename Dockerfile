FROM alpine

# Install openvpn
RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add bash curl ip6tables iptables openvpn \
                shadow tini tzdata tcpdump && \
    rm -rf /tmp/*

ENTRYPOINT ["/sbin/tini", "--", "openvpn"]