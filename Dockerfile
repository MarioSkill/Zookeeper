FROM ubuntu:16.04

# Establece el autor (maintainer) del archivo (tu nombre - el autor del archivo)
MAINTAINER Mario <100292688@alumnos.uc3m.es>

RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y tar wget git curl zip && \
apt-get install -y openjdk-8-jdk && \
apt-cache search maven && \
apt-get install -y maven && \
apt-get install -y autoconf libtool && \
apt-get -y install build-essential python-dev python-six python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev iputils-ping && \
apt-get clean

ENV ZOO_v 3.4.12
ENV ZOO /opt/zookeeper/$ZOO_v

RUN \
curl -O http://apache.rediris.es/zookeeper/zookeeper-$ZOO_v/zookeeper-$ZOO_v.tar.gz
RUN tar -zxf zookeeper-$ZOO_v.tar.gz
RUN mkdir -p $ZOO \
&& mv zookeeper-$ZOO_v/* $ZOO

RUN mkdir -p /tmp/zookeeper 
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/


ADD ./conf.sh /opt/conf.sh
RUN chmod 777 /opt/conf.sh

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper
ADD ./zoo.cfg $ZOO/conf/zoo.cfg

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

CMD ["/opt/conf.sh"]