pipeline{
    agent{
        label 'agent1'
    }
    stages{
        stage('build'){
            steps{
                sh "docker build -t maro4299311/marwan:${env.BUILD_NUMBER} ."
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                sh "docker login -u $user -p $pass"
                sh "docker push maro4299311/marwan:${env.BUILD_NUMBER}"
                    #this is build stage
}
                
            }
        }
        
        stage('deploy'){
            steps{
                sh "docker run -d -p 500${env.BUILD_NUMBER}:8080 maro4299311/marwan:${env.BUILD_NUMBER}"
            }
        }
    }
}
