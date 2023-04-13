FROM postgres:bullseye

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		unzip \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl https://rclone.org/install.sh | bash

ADD backup.sh /
RUN chmod +x /backup.sh

ENTRYPOINT ["/backup.sh"]
