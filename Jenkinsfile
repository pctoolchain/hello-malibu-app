podTemplate(label: 'docker',
  containers: [containerTemplate(name: 'docker', image: 'docker:1.11', ttyEnabled: true, command: 'cat')],
  volumes: [hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')]
  ) {

  def image = "pctn/hello-malibu"
  
  node('docker') {
    stage('Checkout GitHub') {
      git 'https://github.com/pctoolchain/hello-malibu-app.git'
    }
    stage('Docker Build') {
      container('docker') {
        sh "docker build -t ${image} ."
        sh "curl -o /usr/local/bin/aws https://raw.githubusercontent.com/mesosphere/aws-cli/master/aws.sh && chmod a+x /usr/local/bin/aws"
      }
    }
    stage('Docker Push') {
        container('docker') {
            withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'artifactory',
            usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                sh "docker login -u ${USERNAME} -p ${PASSWORD} https://malibu-repo-local.devrepo.malibu-pctn.com"
            }
//            sh "docker tag pctn/hello-malibu:latest malibu-repo-local.devrepo.malibu-pctn.com/pctn/hello-malibu:latest"
//            sh "docker push malibu-repo-local.devrepo.malibu-pctn.com/pctn/hello-malibu:latest"
        }
    }
    stage('AWS Test') {
      container('docker') {
        sh "curl -o /usr/local/bin/aws https://raw.githubusercontent.com/mesosphere/aws-cli/master/aws.sh && chmod a+x /usr/local/bin/aws"
        sh "apk update && apk add bash"
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-role']]) {
          sh "aws s3 ls"
        }
      }
    }    
  }
}
