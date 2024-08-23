pipeline {
    agent any

    stages {
            stage('docker login') {
                steps {
                    script { 
                        withDockerRegistry(credentialsId: 'dockerhub', toolName: 'Docker', url: 'https://hub.docker.com/') {
    
                }
            }
                     
        }
    }
            stage('for dev Branch') {
                when {
                    branch '*/dev'
                }
                steps {
                    script {
                        sh 'docker build -t harsawasthi/dev:latest .'
                        sh 'docker push harsawasthi/dev:latest'


                    }
              
                }
            }
            stage('for master Branch') {
                when {
                    branch '*/master'
                }
                steps {
                    script {
                        sh 'docker build -t harsawasthi/prod:latest .'
                        sh 'docker push harsawasthi/prod:latest'

                    }
                                   
            }
        }
    }
}
