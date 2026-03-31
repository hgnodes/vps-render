FROM ubuntu:22.04

RUN apt update && apt install -y bash curl wget sudo

WORKDIR /app

COPY start.sh /app/start.sh

RUN chmod +x /app/start.sh

CMD ["bash", "start.sh"]
