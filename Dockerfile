FROM maven:3.5.3-jdk-8-alpine
VOLUME /tmp
ADD ./src /src
ADD ./pom.xml /pom.xml
RUN ls -l /src
RUN mvn build