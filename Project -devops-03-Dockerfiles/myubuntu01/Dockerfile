

 FROM ubuntu:latest
# This is commit
 LABEL Description="First Dockerfile" 
 RUN apt-get update&& \
     apt install vim iputils-ping net-tools -y && \
      rm -rf /var/lib/apt/list/*


ENTRYPOINT ["ping"]
CMD ["8.8.8.8"]
