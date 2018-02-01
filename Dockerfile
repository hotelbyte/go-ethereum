# Build Ghbc in a stock Go builder container
FROM golang:1.9-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /go-hotelbyte
RUN cd /go-hotelbyte && make ghbc

# Pull Ghbc into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-hotelbyte/build/bin/ghbc /usr/local/bin/

EXPOSE 30199 30299 30505 30505/udp 30506/udp
ENTRYPOINT ["ghbc"]
