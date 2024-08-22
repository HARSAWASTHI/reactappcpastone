pipeline {
    agent any

    stages {
        stage('docker login') {
            steps {
                     withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
            }
        }

        stage('for master Branch') {
            when {
                branch '*/master'
            }
            steps {
                
                sh 'docker build -t harsawasthi/prod:latest .'
                sh 'docker push harsawasthi/prod:latest'
            }
        }

        stage('for dev Branch') {
            when {
                branch '*/dev'
            }
            steps {
              
                sh 'docker build -t harsawasthi/dev:latest .'
                sh 'docker push harsawasthi/dev:latest'

            }
        }
    }
}
}
