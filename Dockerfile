FROM alpine:3.4
MAINTAINER barwell

RUN apk --update add \
    curl \
    ffmpeg \
    mplayer \
    perl-xml-simple \
    rtmpdump

WORKDIR /app

RUN curl -kLO https://raw.github.com/get-iplayer/get_iplayer/master/get_iplayer && \
    chmod +x ./get_iplayer

RUN mkdir -p /data/output /data/config

ENTRYPOINT ["./get_iplayer", "--profile-dir", "/data/config", "--output", "/data/output"]

CMD ["-h"]
