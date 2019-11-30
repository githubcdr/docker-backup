FROM alpine:latest

# meta
LABEL \
	org.label-schema.maintainer="me codar nl" \
	org.label-schema.name="backup-tools" \
	org.label-schema.description="Docker containers with git, rsync, restic, rclone, scp and mysqldump" \
	org.label-schema.version="1.0" \
	org.label-schema.vcs-url="https://github.com/githubcdr/docker-backup" \
	org.label-schema.schema-version="1.0"

WORKDIR /tmp

RUN	   echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
	&& echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk add --update --no-cache git xz ca-certificates restic mariadb-client wget curl openssh-client rsync burp@testing burp-server@testing \
	&& curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip \
	&& unzip rclone-current-linux-amd64.zip \
	&& cd rclone-*-linux-amd64 \
	&& cp rclone /usr/bin/ \
	&& chown root:root /usr/bin/rclone \
	&& chmod 755 /usr/bin/rclone \
	&& rm -rf /tmp/rclone*
