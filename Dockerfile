FROM l3iggs/archlinux-aur
MAINTAINER barwell

RUN sudo pacman -Sy --noconfirm \
    && sudo pacman -S --needed --noconfirm rtmpdump ffmpeg mplayer id3v2 perl-xml-simple perl-mp3-info \
    && yaourt -S --noconfirm get_iplayer

RUN sudo mkdir -p /data/output /data/config && sudo chown -R docker: /data

ENTRYPOINT ["get_iplayer", "--profile-dir", "/data/config", "--output", "/data/output"]
