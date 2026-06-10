FROM alpine:3.24.0@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
RUN set -ex; \
  chmod +x /entrypoint.sh; \
  apk upgrade --no-cache zlib; \
  apk add --no-cache ansible-core jq curl