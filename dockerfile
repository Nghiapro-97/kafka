FROM openjdk:11.0.10-jre-buster

RUN apt-get update && \
    apt-get install -y wget
         
ENV KAFKA_VERSION 3.4.0
ENV SCALA_VERSION 2.13 

RUN wget "https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" \
    -O kafka.tgz && \
    tar -xf kafka.tgz

COPY start-kafka.sh  /usr/bin
RUN chmod +x  /usr/bin/start-kafka.sh

CMD ["start-kafka.sh"]
   