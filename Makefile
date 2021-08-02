CIRCLE_BUILD_NUM ?= 0
TAG = 0.0.$(CIRCLE_BUILD_NUM)-$(shell git rev-parse --short HEAD)

GOFILES = $(shell find . -name '*.go' )

default: build

workdir:
	mkdir -p workdir

build: workdir/ws

workdir/ws: $(GOFILES)
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o workdir/ws .
