#!/bin/sh

docker run -d --restart=always \ &
  --name=proxypool \ &
  -p 8080:8080 \ &
  -v /path/to/config:/toshiki-proxypool-src/config \ &
  lukemin/toshiki-proxypool \ &
  -c config/config.yaml
