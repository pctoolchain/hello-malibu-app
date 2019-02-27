FROM maven:3.5.3-jdk-8-alpine
VOLUME /tmp
ADD ./src /src
ADD ./pom.xml /pom.xml
#ADD ./wrapper_script.sh /wrapper_script.sh
RUN mvn clean package
#RUN wget https://github.com/prometheus/node_exporter/releases/download/v0.16.0/node_exporter-0.16.0.linux-amd64.tar.gz
#RUN tar xvfz node_exporter-0.16.0.linux-amd64.tar.gz
#RUN wget https://github.com/prometheus/alertmanager/releases/download/v0.15.0-rc.3/alertmanager-0.15.0-rc.3.linux-amd64.tar.gz
#RUN tar xvfz alertmanager-0.15.0-rc.3.linux-amd64.tar.gz 
RUN ls -l
#EXPOSE 9100
EXPOSE 8080
CMD java -jar ./target/spinnaker-demo-1.0.jar
#RUN chmod a+x wrapper_script.shRUN ls -lrt
#CMD ./wrapper_script.sh
