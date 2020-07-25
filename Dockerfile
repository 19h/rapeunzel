FROM ubuntu:latest

COPY entrypoint.sh /entrypoint.sh
COPY route.php /route.php

RUN chmod +x /entrypoint.sh
RUN apt update
RUN DEBIAN_FRONTEND="noninteractive" apt install -y curl php bash gnupg2

RUN curl -L https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb -o /tmp/cloudflared.deb
RUN dpkg -i /tmp/cloudflared.deb

ENTRYPOINT ["/entrypoint.sh"]
