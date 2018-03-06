# build docker image to run the unifi controller
#
# the unifi contoller is used to admin ubunquty wifi access points
#

FROM alpine:3.7
MAINTAINER XiangJL <xjl-tommy@qq.com>

# set unifi environment
ENV UNIFI_VERSION "5.6.30"

# install software
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
#    apk update
RUN apk update && \
    apk add --no-cache openjdk8-jre && \
    apk add --no-cache mongodb && \
    wget http://dl.ubnt.com/unifi/$UNIFI_VERSION/UniFi.unix.zip -O /tmp/UniFi.unix.zip && \
    unzip /tmp/UniFi.unix.zip -d /tmp/ && \
    mv /tmp/UniFi/ /unifi/ && \
    rm -rf /tmp/* && \
    rm -rf /unifi/bin/mongod && \
    ln -s /usr/bin/mongod /unifi/bin/mongod

VOLUME ["/unifi/data"]
VOLUME ["/unifi/logs"]

EXPOSE 8080/tcp 8443/tcp 8880/tcp 8843/tcp 6789/tcp 3478/udp 10001/udp

WORKDIR /unifi
ENTRYPOINT ["java","-jar","/unifi/lib/ace.jar","start"]
