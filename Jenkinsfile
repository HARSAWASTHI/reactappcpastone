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
