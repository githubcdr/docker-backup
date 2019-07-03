FROM alpine:latest

# meta
LABEL \
	org.label-schema.maintainer="me codar nl" \
	org.label-schema.name="backup-tools" \
	org.label-schema.description="Docker containers with rsync, restic and mysqldump" \
	org.label-schema.version="1.0" \
	org.label-schema.vcs-url="https://github.com/githubcdr/docker-backup" \
	org.label-schema.schema-version="1.0"

RUN apk add --update --no-cache xz ca-certificates restic mariadb-client xz wget curl 
