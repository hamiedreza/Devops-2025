# Base image
FROM ubuntu:latest  
  

LABEL Description="First Dockerfile"


RUN apt-get update && \
    apt-get install -y vim iputils-ping net-tools && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash -c "hr Asosheh" hamid

WORKDIR /app


COPY app/entrypoint.sh .


RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]


