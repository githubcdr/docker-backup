FROM alpine:latest

# meta
LABEL \
	org.label-schema.maintainer="me codar nl" \
	org.label-schema.name="backup-tools" \
	org.label-schema.description="Docker containers with rsync, restic and mysqldump" \
	org.label-schema.version="1.0" \
	org.label-schema.vcs-url="https://github.com/githubcdr/docker-backup" \
	org.label-schema.schema-version="1.0"

WORKDIR /tmp

RUN	apk add --update --no-cache xz ca-certificates restic mariadb-client xz wget curl rsync \
	&& curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip \
	&& unzip rclone-current-linux-amd64.zip \
	&& cd rclone-*-linux-amd64 \
	&& cp rclone /usr/bin/ \
	&& chown root:root /usr/bin/rclone \
	&& chmod 755 /usr/bin/rclone \
	&& rm -rf /tmp/rclone*
