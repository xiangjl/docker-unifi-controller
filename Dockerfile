# build docker image to run the unifi controller
#
# the unifi contoller is used to admin ubunquty wifi access points
#

FROM centos:6.7
MAINTAINER XiangJL xjl-tommy@qq.com

# add repos
ADD ./mongodb-org-2.6.repo /etc/yum.repos.d/

# install software
RUN yum install -y mongodb-org java-1.6.0-openjdk unzip

# install unifi
RUN curl http://dl.ubnt.com/unifi/4.7.6/UniFi.unix.zip > /tmp/UniFi.unix.zip && unzip /tmp/UniFi.unix.zip
 && mv /tmp/UniFi/ /opt/UniFi/
ADD ./startup.sh /opt/unifi/

VOLUME /opt/unifi/data
EXPOSE 8080 8443 8880 8843
WORKDIR /opt/unifi
CMD ["/opt/unifi/startup.sh"]
