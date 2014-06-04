# Dockerfile for the Typesafe Activator platform

FROM dockerfile/ubuntu
MAINTAINER James Duncan Davidson <duncan@jdd.io>

RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer oracle-java8-set-default


RUN cd /opt && wget http://downloads.typesafe.com/typesafe-activator/1.2.1/typesafe-activator-1.2.1.zip && \
  cd /opt && unzip typesafe-activator-1.2.1.zip && \
  ln -s /opt/activator-1.2.1 /opt/activator && \
  rm -f /opt/typesafe-activator-1.2.1.zip

EXPOSE 8888
EXPOSE 9000
ENV IVY_HOME /opt/activator/repository
CMD ["/opt/activator/activator", "ui", "-Dhttp.address=0.0.0.0", "-Dorg.slf4j.simpleLogger.defaultLogLevel=trace"]
