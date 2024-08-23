pipeline {
    agent any

    stages {
          stage('for dev Branch') {
                when {
                    branch 'dev'
                }
                steps {
                    script {
                        withDockerRegistry(credentialsId: 'dockerhub', toolName: 'Docker', url: 'https://hub.docker.com/') {
    
                }
                        sh 'docker build -t harsawasthi/dev:latest .'
                        sh 'docker push harsawasthi/dev:latest'


                    }
              
                }
            }
            stage('for master Branch') {
                when {
                    branch 'master'
                }
                steps {
                    script {
                        withDockerRegistry(credentialsId: 'dockerhub', toolName: 'Docker', url: 'https://hub.docker.com/') {
    
                }
                        sh 'docker build -t harsawasthi/prod:latest .'
                        sh 'docker push harsawasthi/prod:latest'

                    }
                                   
            }
        }
    }
}
