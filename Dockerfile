FROM techblog/fastapi:latest

LABEL maintainer="tomer.klein@gmail.com"

ENV PYTHONIOENCODING=utf-8
ENV ENABLE_GOOGLE_ANALYTICS=False

RUN apt update && \
    apt install fping -yqq && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install php php-curl php-cli -yqq
    
#Create working directory
RUN mkdir -p /opt/broadlinkmanager/data

EXPOSE 7020

WORKDIR /opt/broadlinkmanager/

COPY broadlinkmanager /opt/broadlinkmanager

ENTRYPOINT ["/usr/bin/python3", "broadlinkmanager.py"]