pipeline {
  agent any
  stages {
    stage('clone') {
      steps {
        sh 'echo Start clone'
        git(url: 'https://github.com/hhy4761/jenkins_test', branch: 'main', credentialsId: 'github-credentials')
      }
    }

    stage('build') {
      steps {
        sh '''
            echo Start build 
            chmod +x gradlew
            ./gradlew clean build
            ls -al ./build
            '''
      }
    }

    stage('dockerizing') {
      steps {
        sh '''
            echo Start dockerizing
            docker build . -t hhy4761/jenkins_test
            '''
        }
      }

    stage('docker push') {
        steps{
            sh 'echo Start docker push'
            withCredentials([string(credentialsId: 'docker-hub', variable: 'docker_credentials')]) {
                sh 'docker login -u hhy4761 -p ${docker_credentials}'
            }
        }
    }
  }
}