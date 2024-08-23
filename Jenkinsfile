pipeline {
    agent any

    stages {
          stage('for dev Branch') {
                when {
                    branch 'dev'
                }
                steps {
                    script {

                        sh "docker build -t harsawasthi/dev:${env.BUILD_ID} ."
                        withCredentials([usernamePassword(credentialsId: "dockerhub", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                             sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
                             sh "docker push harsawasthi/dev:${env.BUILD_ID}"
   }
                        


                    }
              
                }
            }
            stage('for master Branch') {
                when {
                    branch 'master'
                }
                steps {
                    script {
                       
                        sh "docker build -t harsawasthi/prod:${env.BUILD_ID} ."
                         withCredentials([usernamePassword(credentialsId: "dockerhub", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                             sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
                             sh "docker push harsawasthi/prod:${env.BUILD_ID}"
}
                        

                    }
                                   
            }
        }
    }
}
