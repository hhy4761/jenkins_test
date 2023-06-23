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
ls -al ./build'''
      }
    }

    stage('dockerizing') {
      steps {
        sh '''echo \'docker build start\'
echo $DOCKERHUB_CREDENTIALS_ID
docker login -u $DOCKERHUB_CREDENTIALS_ID
docker build . -t hhy4761/jenkins_test:latest'''
      }
    }

  }
  environment {
    DOCKERHUB_CREDENTIALS_ID = 'hhy4761'
    DOCKERHUB_CREDENTIAS_PW = 'qkqwnj4190'
  }
}