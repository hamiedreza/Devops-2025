# Base image: Ubuntu 24.04 (minimal)
FROM ubuntu:24.04

LABEL maintainer="hamiedreza-asosheh"
LABEL description="Fast, lightweight Nexus Repository Manager 3 on Ubuntu 24.04 LTS with root access"

# Environment variables
ENV NEXUS_VERSION=3.73.0-12
ENV NEXUS_HOME=/opt/nexus
ENV NEXUS_DATA=/opt/sonatype-work
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Install only essentials (fast)
RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-17-jre-headless wget tar ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Create nexus user and directories
RUN useradd -m -s /bin/bash nexus && \
    mkdir -p $NEXUS_HOME $NEXUS_DATA

# Download and extract Nexus
RUN wget -q https://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz -O /tmp/nexus.tar.gz && \
    tar -xzf /tmp/nexus.tar.gz -C /opt && \
    mv /opt/nexus-${NEXUS_VERSION}/* $NEXUS_HOME/ && \
    rm -rf /tmp/nexus.tar.gz && \
    chown -R nexus:nexus $NEXUS_HOME $NEXUS_DATA

# Expose default Nexus port
EXPOSE 8081

# Set working directory
WORKDIR $NEXUS_HOME

# Default user: nexus
USER nexus

# Entry point for Nexus
ENTRYPOINT ["bin/nexus", "run"]

# Allow root access for debugging (you can override user at runtime)
# Example: docker run -it --user root <image> /bin/bash




