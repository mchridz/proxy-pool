FROM alpine:edge

ARG PORT=80

ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates wget && \
    wget -O config.yaml https://raw.githubusercontent.com/andatoshiki/toshiki-proxypool/master/config/config.yaml && \
    wget -O source.yaml https://raw.githubusercontent.com/andatoshiki/toshiki-proxypool/master/config/source.yaml && \
    
RUN chmod +x /start.sh

CMD /start.sh
