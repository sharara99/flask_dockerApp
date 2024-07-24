pipeline{
    agent any
    parameters{
        choice(name: 'choice' , choices: ['main','test','branch'] , description: 'choose on of the options')
        text(name: 'text' , defaultValue: 'default' , description: 'choose on of the options')
        password(name: 'pass' , defaultValue: 'SECRET' , description: 'choose on of the options')
        string(name: 'str' , defaultValue: 'default' , description: 'choose on of the options')
        booleanParam(name: 'bool' , defaultValue: true , description: 'choose on of the options')
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
                echo "${params.text}"
                echo "${params.pass}"
                echo "${params.str}"
                echo "${params.bool}"
            }
        }
        stage('deploy'){
            steps{
                sh"docker run -d -p 400${BUILD_NUMBER}:8080 marwan:${BUILD_NUMBER}"
            }
        }
    }
}
