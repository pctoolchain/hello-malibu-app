FROM java:8
VOLUME /tmp
ADD target/spinnaker-demo-1.0.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]