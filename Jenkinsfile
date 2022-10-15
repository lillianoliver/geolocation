pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
environment {
    registry = '668278409505.dkr.ecr.us-east-1.amazonaws.com/hello-world'
    registryCredential = 'Jenkins-ECR'
    dockerimage = ''
    }
    stages {
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/lillianoliver/helloworld_jan_22-2.git'   
            }
        }        
        stage('Code Build') {
            steps {
                sh 'mvn clean'
                sh 'mvn install -DskipTests'
                sh 'mvn package DskipTests'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Image') {
            steps {
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                } 
            }
        }
        stage('Deploy Image') {
            steps {
                script{ 
                    docker.withRegistry("https://"+registry,"ecr:us-east-1:"+registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }  
    }
}

