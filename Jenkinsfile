pipeline{
    agent any
    stage('github clone') {
        steps {
            script {
                properties([pipelineTriggers([pollSCM('*****')])])
            }
            git branch: 'main', url: 'https://github.com/hhy4761/jenkins_test'
        }
    }
    envionment {
        imageName = "my-spring-boot"
        registryCredential = 'docker-hub'
        dockerImage = ''
    }

    stage('Build docker') {
        agent any
        steps {
            echo 'Build Docker Image'
            script {
                dockerImage = docker.build.imageName
            }
        }
        post {
            failure {
                error 'This pipeline stops here...'
            }
        }
    }
    
    stage('Push Docker') {
        agent any
        steps {
            echo 'Push Docker'
            script {
                docker.withRegistry('', registryCredential) {
                    dockerImage.push("latest")
                }
            }
        }
        post {
            failure {
                error 'This pipeline stops here...'
            }
        }
    }
}