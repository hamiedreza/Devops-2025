


 FROM ubuntu:latest
# This is commit
 LABEL Description="First Dockerfile" 
 RUN apt-get update&& \
     apt install vim iputils-ping net-tools -y && \
      rm -rf /var/lib/apt/list/*



CMD ["ping", "-c 8", "8.8.8.8"]
