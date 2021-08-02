FROM alpine:3.5

ADD ./workdir/ws /usr/bin/ws

ENTRYPOINT ws
