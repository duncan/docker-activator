FROM duncan/java
MAINTAINER James Duncan Davidson <duncan@jdd.io>

RUN cd /opt && wget http://downloads.typesafe.com/typesafe-activator/1.2.1/typesafe-activator-1.2.1.zip && \
  cd /opt && unzip typesafe-activator-1.2.1.zip && \
  ln -s /opt/activator-1.2.1 /opt/activator && \
  rm -f /opt/typesafe-activator-1.2.1.zip

EXPOSE 8888
EXPOSE 9000
ENV IVY_HOME /opt/activator/repository
CMD ["/opt/activator/activator", "ui", "-Dhttp.address=0.0.0.0", "-Dorg.slf4j.simpleLogger.defaultLogLevel=trace"]
