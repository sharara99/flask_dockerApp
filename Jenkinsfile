pipeline{
    agent any
    stages{
        stage('build'){
            steps{
                sh "docker build -t marwan:${BUILD_NUMBER} ."
            }
        }
        stage('test'){
            steps{
                echo 'test stage'
            }
        }
        stage('deploy'){
            steps{
                sh"docker run -d -p 4000:8080 marwan:${BUILD_NUMBER}"
            }
        }
    }
}
