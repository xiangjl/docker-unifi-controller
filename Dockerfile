# build docker image to run the unifi controller
#
# the unifi contoller is used to admin ubunquty wifi access points
#

FROM centos:6
MAINTAINER XiangJL <xjl-tommy@qq.com>

# add repos
ADD ./mongodb-org-2.6.repo /etc/yum.repos.d/

# install software
RUN yum makecache && \
    yum update -y && \
    yum install -y mongodb-org java-1.8.0-openjdk unzip && \
    yum clean all

# set java environment
ENV JAVA_HOME "/usr/lib/jvm/jre-1.8.0-openjdk.x86_64"
ENV CLASSPATH ".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar"

# set unifi environment
ENV UNIFI_VERSION "5.5.24"

# install unifi
RUN curl http://dl.ubnt.com/unifi/$UNIFI_VERSION/UniFi.unix.zip > /tmp/UniFi.unix.zip && \
    unzip /tmp/UniFi.unix.zip -d /tmp/ && \
    mv /tmp/UniFi/ /opt/unifi/ && \
    rm -rf /tmp/*

VOLUME ["/opt/unifi/data"]
VOLUME ["/opt/unifi/logs"]
EXPOSE 8080/tcp 8443/tcp 8880/tcp 8843/tcp 6789/tcp 3478/udp 10001/udp
WORKDIR /opt/unifi
ENTRYPOINT ["java","-jar","/opt/unifi/lib/ace.jar","start"]
