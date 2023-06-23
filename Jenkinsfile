pipeline {
  agent any
  stages {
    stage('clone') {
      steps {
        git(url: 'https://github.com/hhy4761/jenkins_test', branch: 'main', credentialsId: 'github-credentials')
        sh 'echo | ls'
      }
    }

    stage('build') {
      steps {
        sh '''chmod +x gradlew
./gradlew clean build
ls -al ./build\''''
      }
    }

  }
}