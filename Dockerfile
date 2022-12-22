FROM alpine:edge


ADD etc/Caddyfile /tmp/Caddyfile
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
    wget -O config.yaml https://raw.githubusercontent.com/andatoshiki/toshiki-proxypool/master/config/config.yaml && \
    wget -O source.yaml https://raw.githubusercontent.com/andatoshiki/toshiki-proxypool/master/config/source.yaml && \
   
    mkdir -p /etc/caddy/ /usr/share/caddy && echo -e "User-agent: *\nDisallow: /" >/usr/share/caddy/robots.txt && \
    wget $CADDYIndexPage -O /usr/share/caddy/index.html && unzip -qo /usr/share/caddy/index.html -d /usr/share/caddy/ && mv /usr/share/caddy/*/* /usr/share/caddy/ && \
  

RUN chmod +x /start.sh

CMD /start.sh
