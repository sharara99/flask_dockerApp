pipeline {
    agent any 
    stages {
        stage('Build') {
            steps {
                sh "docker build -t sharara99/maven:${BUILD_NUMBER} ."
                withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    sh "docker login -u $user -p $pass"
                }
                sh "docker push sharara99/maven:${BUILD_NUMBER}"
            }
        }
        
        stage('Deploy') {
            steps {
                sh "docker run -d -p 5000:6000 sharara99/maven:${BUILD_NUMBER}"
            }
        }
    }
}
