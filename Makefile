CIRCLE_BUILD_NUM ?= 0
TAG = 0.0.$(CIRCLE_BUILD_NUM)-$(shell git rev-parse --short HEAD)

GOFILES = $(shell find ws -name '*.go' )

default: build

workdir:
	mkdir -p workdir

build: workdir/contacts

build-native: $(GOFILES)
	go build -o workdir/native-contacts .

workdir/contacts: $(GOFILES)
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o workdir/contacts .
