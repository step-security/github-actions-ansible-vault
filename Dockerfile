FROM alpine:3.23.4@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
RUN set -ex; \
  chmod +x /entrypoint.sh; \
  apk upgrade --no-cache zlib; \
  apk add --no-cache ansible-core jq curl