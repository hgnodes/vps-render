FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl wget sudo git unzip tar tmate netcat \
    && apt clean

WORKDIR /root

COPY start.sh /start.sh

RUN chmod +x /start.sh

CMD ["bash", "/start.sh"]
