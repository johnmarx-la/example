FROM alpine:3.5

ADD ./workdir/contacts /usr/bin/contacts

ENTRYPOINT contacts
