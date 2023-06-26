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
            docker build . -t hhy4761/jenkins_test:latest
            '''
        }
      }

    stage('docker push') {
        steps{
            sh 'echo Start docker push'
            withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'docker_credentials_user', passwordVariable: 'docker_credentials_pw')]) {
                sh '''
                    docker login -u $docker_credentials_user -p $docker_credentials_pw
                    docker push hhy4761/jenkins_test:latest
                    '''

            }
        }
    }
  }
}