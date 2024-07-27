pipeline{
    agent{
        label any
    }
    stages{
        stage('build'){
            steps{
          sh "docker build -t maro4299311/test:${BUILD_NUMBER}"
          withCredentials([UsernamePassword(credentialsId: 'dockerhub', usernameVariable: 'user' , 'PasswordVariable': 'pass')]) {
          sh "docker login -u $user -p $pass"
          sh "docker push maro4299311/test:${BUILD_NUMBER}"
}  
            }
  
                  }
    }
}
