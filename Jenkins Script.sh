pipeline {
    agent none
    environment {
        DOCKERHUB_CREDENTIALS=credentials('d094028c-ac56-48c7-acee-c2ffaed6c71f')
    }

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('git') {
            agent {
                label 'K8-node'
            }
            steps {
                git 'https://github.com/cgr258/website.git'
            }
        }
        stage('docker') {
            agent {
                label 'K8-node'
            }
            steps {
                sh 'sudo docker build /home/ubuntu/jenkins/workspace/ProjectJob -t cgr258/project2'
                sh 'sudo echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'sudo docker push cgr258/project2'
            }
        }
        stage('kubernetes') {
            agent {
                label 'K8-node'
            }
            steps {
                sh 'kubectl delete deploy nginx-deployment'
                sh 'kubectl apply -f deployment.yml'
                sh 'kubectl delete service my-service'
                sh 'kubectl apply -f service.yml'
            }
        }
        
    }
}
