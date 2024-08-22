pipeline {
    agent any

    stages {
        stage('docker login') {
            steps {
                      withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) 
                      
            }
        }

        stage('for master Branch') {
            when {
                branch '*/master'
            }
            steps {
                
                sh 'docker build -t myapp .'
                sh 'docker tag myapp $DOCKER_USERNAME/prod'
                sh 'docker push $DOCKER_USERNAME/prod:latest'
            }
        }

        stage('for dev Branch') {
            when {
                branch '*/dev'
            }
            steps {
              
                sh 'docker build -t myapp .'
                sh 'docker tag myapp $DOCKER_USERNAME/dev'
                sh 'docker push $DOCKER_USERNAME/dev:latest'

            }
        }
    }
}
