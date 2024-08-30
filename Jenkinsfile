pipeline {
    agent any
    stages {
        stage('Setup') {
            steps {
                git branch: 'main', credentialsId: 'Github', url: 'https://github.com/sharara99/flask_dockerApp.git'
            }
        }
        
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t sharara99/flask-app-pipeline:${BUILD_NUMBER} ."
                    
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                        sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                    }
                    
                    // Push the Docker image to Docker Hub
                    sh "docker push sharara99/flask-app-pipeline:${BUILD_NUMBER}"
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    echo "Deploying on Kubernetes..."
                    // Apply the Kubernetes manifest
                    sh "kubectl apply -f ${WORKSPACE}/flask-pod.yml"
                }
            }
        }
    }
}
