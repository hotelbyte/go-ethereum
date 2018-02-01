FROM alpine:3.7

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 https://github.com/hotelbyte/go-hotelbyte && \
  (cd go-hotelbyte && make ghbc) && \
  cp go-hotelbyte/build/bin/ghbc /ghbc && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-hotelbyte && rm -rf /var/cache/apk/*

EXPOSE 30199
EXPOSE 30505

ENTRYPOINT ["/ghbc"]
