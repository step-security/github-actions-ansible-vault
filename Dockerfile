FROM alpine:latest
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
RUN set -ex; \
  chmod +x /entrypoint.sh; \
  apk add --no-cache ansible-core jq curl