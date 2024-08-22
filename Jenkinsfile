pipeline {
    agent any

    environment{
        Docker_dev_Repo = harsawasthi/dev
    }

    stages {
        stage('Build') {
            steps {
                // Build the Docker image
                sh "docker build -t ${Docker_dev_Repo} ."
            }
        }

        stage('Deploy') {
            steps {
              
                // Deploy the Docker image using the deploy script
                sh "docker push ${Docker_dev_Repo}"
            }
        }
    }
}
