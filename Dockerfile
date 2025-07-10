FROM ghcr.io/immich-app/postgres:17-vectorchord0.4.3-pgvectors0.3.0 AS builder

FROM bitnami/postgresql:17.5.0-debian-12-r16

COPY --from=builder /usr/lib/postgresql/17/lib/vector.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/lib/postgresql/17/lib/vectors.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/lib/postgresql/17/lib/vchord.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/share/postgresql/17/extension/vector* /opt/bitnami/postgresql/share/extension/
COPY --from=builder /usr/share/postgresql/17/extension/vectors* /opt/bitnami/postgresql/share/extension/
COPY --from=builder /usr/share/postgresql/17/extension/vchord* /opt/bitnami/postgresql/share/extension/