pipeline{
    agent any
    parameters{
        choice(name: 'choice' , choices: ['main','test',branch] , description: 'choose on of the options')
    }
    stages{
        stage('build'){
            steps{
                sh "docker build -t marwan:${BUILD_NUMBER} ."
            }
        }
        stage('test'){
            steps{
                echo 'test stage'
                echo ' ${params.choice}'
            }
        }
        stage('deploy'){
            steps{
                sh"docker run -d -p 400${BUILD_NUMBER}:8080 marwan:${BUILD_NUMBER}"
            }
        }
    }
}
