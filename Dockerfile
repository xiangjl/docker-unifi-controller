# build docker image to run the unifi controller
#
# the unifi contoller is used to admin ubunquty wifi access points
#

FROM centos:6.8
MAINTAINER XiangJL <xjl-tommy@qq.com>

# add repos
ADD ./mongodb-org-2.6.repo /etc/yum.repos.d/
# RUN curl http://mirrors.aliyun.com/repo/Centos-6.repo > /etc/yum.repos.d/CentOS-Base.repo && \
#     curl http://mirrors.aliyun.com/mongodb/yum/redhat/mongodb-org.repo > /etc/yum.repos.d/mongodb-org.repo

# install software
RUN yum makecache && \
    yum install -y mongodb-org java-1.6.0-openjdk unzip && \
    yum clean all

# install unifi
RUN curl http://dl.ubnt.com/unifi/4.8.20/UniFi.unix.zip > /tmp/UniFi.unix.zip && \
    unzip /tmp/UniFi.unix.zip -d /tmp/ && \
    mv /tmp/UniFi/ /opt/unifi/ && \
    rm -rf /tmp/*

# set environment
ENV JAVA_HOME "/usr/lib/jvm/jre-1.6.0-openjdk.x86_64"
ENV CLASSPATH ".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar"

VOLUME ["/opt/unifi/data"]
EXPOSE 8080 8443 8880 8843
WORKDIR /opt/unifi
ENTRYPOINT ["java","-jar","/opt/unifi/lib/ace.jar","start"]
