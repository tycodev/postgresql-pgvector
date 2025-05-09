FROM tensorchord/pgvecto-rs:pg16-v0.3.0 AS builder

FROM bitnami/postgresql:17.4.0-debian-12-r16

COPY --from=builder /usr/lib/postgresql/16/lib/vectors.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/share/postgresql/16/extension/vectors* /opt/bitnami/postgresql/share/extension/