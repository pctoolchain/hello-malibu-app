sudo add-apt-repository ppa:webupd8team/java > var/log/update-java.log 2>&1
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-set-default
cd /usr/share/jdeb/lib/
java -jar spinnaker-demo-1.0.jar
