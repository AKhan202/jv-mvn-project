pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = ''  // Docker Hub credentials ID
        DOCKER_IMAGE_NAME = 'java-maven'
        DOCKER_IMAGE_TAG = 'latest'
        REPO_URL = 'https://hub.docker.com/repositories/khana88'         // Docker Hub URL
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git repository
                git 'https://github.com/AKhan202/java-maven-project.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                // Build the Maven project
                
                sh 'mvn clean package'
            }
        }

        

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    echo 'Starting to build Docker image...'
                    docker.build("${java-maven}:${latest}")
                    echo 'Docker image built successfully.'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {

            // Log in to Docker Hub and push the image
                    docker.withRegistry('https://index.docker.io/v1/', 'khana88') {
                    docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").push("latest")
            }
        }
    }
}
            }
        }
    

    post {
        always {
            // Clean up Docker images
            sh 'docker system prune -f'
        }
    }

