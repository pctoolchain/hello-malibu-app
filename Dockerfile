FROM maven:3.5.3-jdk-8-alpine
VOLUME /tmp
ADD ./src /src
ADD ./pom.xml /pom.xml
RUN mvn package
RUN wget https://github.com/prometheus/node_exporter/releases/download/v0.16.0/node_exporter-0.16.0.linux-amd64.tar.gz
RUN ls -l
RUN tar xvfz node_exporter-0.16.0.linux-amd64.tar.gz
RUN ls -l
RUN cd node_exporter-*
RUN ls -l
RUN ./node_exporter &
EXPOSE 9100
EXPOSE 8080
RUN cd ../
WORKDIR ./target
RUN ls -l
CMD ["java", "-jar", "spinnaker-demo-1.0.jar"]