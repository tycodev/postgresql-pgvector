FROM tensorchord/pgvecto-rs:pg16-v0.4.0 as builder

FROM bitnami/postgresql:16.3.0-debian-12-r16

COPY --from=builder /usr/lib/postgresql/16/lib/vectors.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/share/postgresql/16/extension/vectors* /opt/bitnami/postgresql/share/extension/