FROM alpine:latest@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
RUN set -ex; \
  chmod +x /entrypoint.sh; \
  apk add --no-cache ansible-core jq curl