# build docker image to run the unifi controller
#
# the unifi contoller is used to admin ubunquty wifi access points
#

FROM centos:6
MAINTAINER XiangJL <xjl-tommy@qq.com>

# add repos
ADD ./mongodb-org-3.4.repo /etc/yum.repos.d/

# install software
RUN yum makecache fast && \
    yum update -y && \
    yum install -y mongodb-org java-1.8.0-openjdk unzip && \
    yum clean all

# set unifi environment
ENV UNIFI_VERSION "5.8.24"

# install unifi
RUN curl http://dl.ubnt.com/unifi/$UNIFI_VERSION/UniFi.unix.zip > /tmp/UniFi.unix.zip && \
    unzip /tmp/UniFi.unix.zip -d /tmp/ && \
    mv /tmp/UniFi/ /unifi/ && \
    rm -rf /tmp/*

VOLUME ["/unifi/data"]
VOLUME ["/unifi/logs"]

EXPOSE 8080/tcp 8443/tcp 8880/tcp 8843/tcp 6789/tcp 3478/udp 10001/udp

WORKDIR /unifi

ENTRYPOINT ["java","-jar","/unifi/lib/ace.jar","start"]
