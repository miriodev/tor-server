FROM alpine:3.21

RUN addgroup -g 35000 -S toruser && adduser -u 35000 -S -G toruser -D toruser && apk add --no-cache tor

COPY torrc /etc/torrc

USER toruser
EXPOSE 9050

CMD ["/usr/bin/tor", "-f", "/etc/torrc"]