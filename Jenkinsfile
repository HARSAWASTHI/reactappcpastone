pipeline {
    agent any

    environment{
        Docker_dev_Repo = harsawasthi/dev
        Docker_prod_Repo = harsawasthi/prod

    }

    stages {
        stage(docker login) {
            steps {
                      withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
            }
        }

        stage('for master Branch') {
            when {
                branch '*/master'
            }
            steps {
                // Build the Docker image
                sh "docker build -t ${Docker_prod_Repo} ."
                sh "docker push ${Docker_prod_Repo}:latest"
            }
        }

        stage('for dev Branch') {
            when {
                branch '*/dev'
            }
            steps {
              
                sh "docker build -t ${Docker_dev_Repo} ."
                sh "docker push ${Docker_dev_Repo}:latest"
            }
        }
    }
}