pipeline {
  agent any
  stages {
    stage('clone') {
      steps {
        git(url: 'https://github.com/hhy4761/jenkins_test', branch: 'main', credentialsId: 'github-credentials')
      }
    }

  }
}