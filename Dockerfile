FROM maven:3.5.3-jdk-8-alpine
VOLUME /tmp
ADD ./src /src
ADD ./pom.xml /pom.xml
RUN mvn package
WORKDIR ./target
RUN ls -l
CMD ["java", "-jar", "spinnaker-demo-1.0.jar"]