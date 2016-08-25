FROM alpine:3.4
MAINTAINER barwell

RUN apk --update add \
    curl \
    ffmpeg \
    mplayer \
    perl-xml-simple \
    rtmpdump

RUN mkdir -p /data/output /data/config

WORKDIR /app

ENV GET_IPLAYER_VERSION=2.96

RUN curl -L https://github.com/get-iplayer/get_iplayer/archive/v${GET_IPLAYER_VERSION}.tar.gz | tar -xvz -C /tmp && \
    mv /tmp/get_iplayer-${GET_IPLAYER_VERSION}/get_iplayer . && \
    rm -rf /tmp/* && \
    chmod +x ./get_iplayer

ENTRYPOINT ["./get_iplayer", "--profile-dir", "/data/config", "--output", "/data/output"]

CMD ["-h"]
