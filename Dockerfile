FROM maven:3.5.3-jdk-8-alpine
VOLUME /tmp
ADD ./src /src
ADD ./pom.xml /pom.xml
RUN mvn package
RUN cd target/
CMD ["java", "-jar", "spinnaker-demo-1.0.jar"]