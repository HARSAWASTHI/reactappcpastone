pipeline {
    agent any

    stages {
          stage('for dev Branch') {
                when {
                    branch 'dev'
                }
                steps {
                    script {
                        withDockerRegistry(credentialsId: "dockerhub", url: "https://registry.hub.docker.com/") {
   }
                        sh "docker build -t harsawasthi/dev:${env.BUILD_ID} ."
                        sh "docker push harsawasthi/dev:${env.BUILD_ID}"


                    }
              
                }
            }
            stage('for master Branch') {
                when {
                    branch 'master'
                }
                steps {
                    script {
                        withDockerRegistry(credentialsId: "dockerhub", url: "https://registry.hub.docker.com/") {
}
                        sh "docker build -t harsawasthi/prod:${env.BUILD_ID} ."
                        sh "docker push harsawasthi/prod:${env.BUILD_ID}"

                    }
                                   
            }
        }
    }
}
