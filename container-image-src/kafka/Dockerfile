FROM nordstrom/java-7:0.0.4
MAINTAINER Emmanuel Gomez <emmanuel.gomez@nordstrom.com>

ENV KAFKA_SCALA_VERSION 2.9.2
ENV KAFKA_VERSION 0.8.1.1

ENV KAFKA_RELEASE $KAFKA_SCALA_VERSION-$KAFKA_VERSION
ENV KAFKA_HOME /opt/kafka_$KAFKA_RELEASE

ADD dist/kafka_$KAFKA_RELEASE.tgz /opt/
RUN ln -s /opt/kafka_$KAFKA_RELEASE /opt/kafka

ADD conf/server.properties $KAFKA_HOME/config/server.properties
ADD bin/start-kafka.sh /bin/

CMD ["/bin/start-kafka.sh"]
