FROM ubuntu:24.04

ENV NEXUS_VERSION=3.73.0-12
ENV NEXUS_HOME=/opt/nexus
ENV NEXUS_DATA=/nexus-data
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-17-jre-headless wget tar ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p $NEXUS_HOME $NEXUS_DATA

RUN wget -q https://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz -O /tmp/nexus.tar.gz && \
    tar -xzf /tmp/nexus.tar.gz -C /opt && \
    mv /opt/nexus-${NEXUS_VERSION}/* $NEXUS_HOME/ && \
    rm -rf /tmp/nexus.tar.gz && \
    chmod +x $NEXUS_HOME/bin/nexus && \
    chown -R root:root $NEXUS_HOME $NEXUS_DATA

WORKDIR $NEXUS_HOME
EXPOSE 8081
VOLUME ["/nexus-data"]

CMD ["/opt/nexus/bin/nexus", "run"]


