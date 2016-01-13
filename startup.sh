#!/bin/sh

JAVA_HOME=/usr/lib/jvm/jre-1.6.0-openjdk.x86_64
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_HOME
export PATH
export CLASSPATH

java -jar /opt/unifi/lib/ace.jar start
