FROM 		debian:bookworm


COPY		./tools/script.sh /tmp/script.sh

RUN			chmod +x /tmp/script.sh


# ENV 	DB_NAME="ab"

# ENV		DB_USER="PP"

# ENV		DB_PASSWORD="0000"

# ENV		DB_ROOT_PASSWORD="0000"

# # ENV

EXPOSE		3306

ENTRYPOINT	["/bin/bash", "/tmp/script.sh"]

