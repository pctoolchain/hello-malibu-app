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
        sh "docker build --no-cache -t ${image} ."
      }
    }
    stage('Docker Push') {
      container('docker') {
          withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'artifactory',
          usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
              sh "docker login -u ${USERNAME} -p ${PASSWORD} https://malibu-repo-local.devrepo.malibu-pctn.com"
          }
          sh "docker tag pctn/hello-malibu:latest malibu-repo-local.devrepo.malibu-pctn.com/pctn/hello-malibu:${env.BUILD_NUMBER}"
          sh "docker push malibu-repo-local.devrepo.malibu-pctn.com/pctn/hello-malibu:latest"
      }
    }
    stage('Trigger Spinnaker') {
      container('docker') {
        withCredentials([string(credentialsId: 'spin-pipeline', variable: 'secretUrl')]) {
          sh "curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{}' '${secretUrl}'"
        }
      }
    }
  }
}
