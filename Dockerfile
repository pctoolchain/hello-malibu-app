FROM maven:3.5.3-jdk-8-alpine
VOLUME /tmp

RUN apt-get update -qq && \
    apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -qq && \
    apt-get install -qqy docker-ce && \
    usermod -aG docker jenkins && \
    chown -R jenkins:jenkins $JENKINS_HOME/

ADD ./src /src
ADD ./pom.xml /pom.xml
ADD ./wrapper_script.sh /wrapper_script.sh
RUN mvn package
RUN wget https://github.com/prometheus/node_exporter/releases/download/v0.16.0/node_exporter-0.16.0.linux-amd64.tar.gz
RUN tar xvfz node_exporter-0.16.0.linux-amd64.tar.gz
#RUN wget https://github.com/prometheus/alertmanager/releases/download/v0.15.0-rc.3/alertmanager-0.15.0-rc.3.linux-amd64.tar.gz
#RUN tar xvfz alertmanager-0.15.0-rc.3.linux-amd64.tar.gz
RUN ls -l
EXPOSE 9100
EXPOSE 8080
RUN chmod a+x wrapper_script.sh
RUN ls -lrt
CMD ./wrapper_script.sh
