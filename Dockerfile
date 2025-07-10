FROM ghcr.io/immich-app/postgres:16-vectorchord0.3.0-pgvectors0.3.0 AS builder

FROM bitnami/postgresql:16.4.0-debian-12-r16

COPY --from=builder /usr/lib/postgresql/16/lib/vector.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/lib/postgresql/16/lib/vectors.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/lib/postgresql/16/lib/vchord.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/share/postgresql/16/extension/vector* /opt/bitnami/postgresql/share/extension/
COPY --from=builder /usr/share/postgresql/16/extension/vectors* /opt/bitnami/postgresql/share/extension/
COPY --from=builder /usr/share/postgresql/16/extension/vchord* /opt/bitnami/postgresql/share/extension/