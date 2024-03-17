pipeline{
    agent any 
    tools {
        maven 'maven3'
    }
    stages {
        stage ('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sumitgupta190a/Aaptatt-Project.git']])
                sh 'mvn -Dmaven.test.faiure.ignore=true clean package'
            }
        }
        
        stage ('Build Docker Image')
        {
            steps {
                script {
                    sh 'docker build -t sumitgupta190/hello-world-1.0 .'
                }
            }
        }
        
        stage ('Push docker image'){
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpassid', variable: 'dockerhubpass')]) {
                    sh 'docker login -u sumitgupta190 -p ${dockerhubpass}'
}
                sh 'docker push sumitgupta190/hello-world-1.0'
                }
                
            }
        }
    }
}
