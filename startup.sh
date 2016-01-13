#!/bin/sh

JAVA_HOME=/opt/jdk1.6.0_45
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_HOME
export PATH
export CLASSPATH

java -jar /opt/unifi/lib/ace.jar start
