pipeline{
    agent any
    parameters{
        choice(name: 'choice' , choices: ['main','test','branch'] , description: 'choose on of the options')
        text(name: 'choice' , defaultValue: 'default' , description: 'choose on of the options')
        password(name: 'choice' , defaultValue: 'secret' , description: 'choose on of the options')
        string(name: 'choice' , defaultValue: 'default' , description: 'choose on of the options')
        booleanParam(name: 'choice' , defaultValue: true , description: 'choose on of the options')
    }
    environment{
        marwan = 'string0'
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
                echo "${params.choice}"
                echo "${env.marwan}"
            }
        }
        stage('deploy'){
            steps{
                sh"docker run -d -p 400${BUILD_NUMBER}:8080 marwan:${BUILD_NUMBER}"
            }
        }
    }
}
