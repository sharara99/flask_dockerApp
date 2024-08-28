pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'Github', url: 'https://github.com/sharara99/flask_dockerApp.git'
            }
        }
        
        stage('Build') {
            steps {
                sh "docker build -t sharara99/flask-app-pipeline:${BUILD_NUMBER} ."
                withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    sh "docker login -u $user -p $pass"
                }
                sh "docker push sharara99/flask-app-pipeline:${BUILD_NUMBER}"
            }
        }
        
        stage('Deploy') {
            steps {
                echo "Deploying on Kubernetes..."

                sh "kubectl apply -f flask-pod.yml"
            }
        }
    }
}
