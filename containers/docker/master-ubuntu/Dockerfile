FROM ubuntu:xenial

ENV PATH=/usr/lib/go-1.9/bin:$PATH

RUN \
  apt-get update && apt-get upgrade -q -y && \
  apt-get install -y --no-install-recommends golang-1.9 git make gcc libc-dev ca-certificates && \
  git clone --depth 1 --branch release/1.7 https://github.com/hotelbyte/go-hotelbyte && \
  (cd go-hotelbyte && make ghbc) && \
  cp go-hotelbyte/build/bin/ghbc /ghbc && \
  apt-get remove -y golang-1.9 git make gcc libc-dev && apt autoremove -y && apt-get clean && \
  rm -rf /go-hotelbyte

EXPOSE 30199
EXPOSE 30505

ENTRYPOINT ["/ghbc"]
