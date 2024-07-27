pipeline{
    agent any
    stages{
        stage('build'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                  sh "docker build -t maro4299311/test:${env.BUILD_NUMBER} ."
                  sh "docker login -u $USERNAME -p $PASSWORD"
                  sh "docker push maro4299311/test:${env.BUILD_NUMBER}"
                     
        }
            }
        }
    }
}
