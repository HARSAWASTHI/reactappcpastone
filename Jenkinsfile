pipeline {
    agent any

    stages {
        stage('docker login') {
            steps {
                     sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
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
