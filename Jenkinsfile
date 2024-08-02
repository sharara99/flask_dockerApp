pipeline{
    agent{
        label 'agent'
        //sadasdas
    }
    stages{
        stage('build'){
            steps{
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/marwansss/flask_dockerApp.git'
                sh "docker build -t maro4299311/marwan:${env.BUILD_ID} ."
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'ahmed')]) {
                sh "docker login -u $ahmed -p $pass "
}
                sh "docker push maro4299311/marwan:${env.BUILD_ID}"
               
            }
        }
        
        stage('deploy'){
            steps{
                sh "docker run -d -p 500${env.BUILD_ID}:8080 maro4299311/marwan:${env.BUILD_ID}"
            }
        }
    }
}
