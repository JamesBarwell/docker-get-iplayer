FROM alpine:3.16.2
MAINTAINER barwell

RUN apk --update add \
    ffmpeg \
    openssl \
    perl-mojolicious \
    perl-lwp-protocol-https \
    perl-xml-simple \
    perl-xml-libxml

RUN apk add atomicparsley --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && ln -s `which atomicparsley` /usr/local/bin/AtomicParsley

RUN mkdir -p /data/output /data/config

WORKDIR /app

ENV GET_IPLAYER_VERSION=3.29

RUN wget -qO- https://github.com/get-iplayer/get_iplayer/archive/v${GET_IPLAYER_VERSION}.tar.gz | tar -xvz -C /tmp && \
    mv /tmp/get_iplayer-${GET_IPLAYER_VERSION}/get_iplayer . && \
    rm -rf /tmp/* && \
    chmod +x ./get_iplayer

ENTRYPOINT ["./get_iplayer", "--ffmpeg", "/usr/bin/ffmpeg", "--profile-dir", "/data/config", "--output", "/data/output"]

CMD ["-h"]
