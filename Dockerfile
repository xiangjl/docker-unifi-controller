# build docker image to run the unifi controller
#
# the unifi contoller is used to admin ubunquty wifi access points
#

FROM centos:6.7
MAINTAINER XiangJL xjl-tommy@qq.com

# add repos
ADD ./mongodb-org-2.6.repo /etc/yum.repos.d/
# RUN curl http://mirrors.aliyun.com/repo/Centos-6.repo > /etc/yum.repos.d/CentOS-Base.repo && \
#     curl http://mirrors.aliyun.com/mongodb/yum/redhat/mongodb-org.repo > /etc/yum.repos.d/mongodb-org.repo

# install software
RUN yum makecache && \
    yum install -y mongodb-org java-1.6.0-openjdk unzip && \
    yum clean all

# install unifi
RUN curl http://dl.ubnt.com/unifi/4.7.6/UniFi.unix.zip > /tmp/UniFi.unix.zip && \
    unzip /tmp/UniFi.unix.zip && \
    mv /tmp/UniFi/ /opt/UniFi/ && \
    rm -rf /tmp/*

# add startup.sh
ADD ./startup.sh /opt/unifi/

VOLUME /opt/unifi/data
EXPOSE 8080 8443 8880 8843
WORKDIR /opt/unifi
ENTRYPOINT ["/opt/unifi/startup.sh"]
