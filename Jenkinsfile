pipeline {
    environment {
        DOCKER_DEV_REPO = 'sumitdhal/dev-repo'
        DOCKER_PROD_REPO = 'sumitdhal/prod-repo'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: env.BRANCH_NAME, url: 'https://github.com/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = ''
                    if (env.BRANCH_NAME == 'dev') {
                        imageName = "${DOCKER_DEV_REPO}:${env.BUILD_NUMBER}"
                    } else if (env.BRANCH_NAME == 'master') {
                        imageName = "${DOCKER_PROD_REPO}:${env.BUILD_NUMBER}"
                    }
                    sh "docker build -t ${imageName} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    def imageName = ''
                    if (env.BRANCH_NAME == 'dev') {
                        imageName = "${DOCKER_DEV_REPO}:${env.BUILD_NUMBER}"
                    } else if (env.BRANCH_NAME == 'master') {
                        imageName = "${DOCKER_PROD_REPO}:${env.BUILD_NUMBER}"
                    }
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                        sh "docker push ${imageName}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build, Push, and Deploy completed successfully!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}