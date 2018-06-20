FROM maven:3.5.3-jdk-8-alpine
VOLUME /tmp
ADD ./src /src
ADD ./pom.xml /pom.xml
ADD ./wrapper_script.sh /wrapper_script.sh
RUN mvn package
RUN wget https://github.com/prometheus/node_exporter/releases/download/v0.16.0/node_exporter-0.16.0.linux-amd64.tar.gz
RUN tar xvfz node_exporter-0.16.0.linux-amd64.tar.gz
RUN ls -l
EXPOSE 9100
EXPOSE 8080
RUN chmod a+x wrapper_script.sh
RUN ls -lrt
RUN apk add --no-cache python && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache
CMD ./wrapper_script.sh
