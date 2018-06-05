FROM java:8
VOLUME /tmp
ADD ./src /src
ADD ./pom.xml pom.xml
RUN ls -l