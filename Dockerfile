FROM java:8
VOLUME /tmp
RUN ls -l
ADD target/spinnaker-demo-1.0.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]