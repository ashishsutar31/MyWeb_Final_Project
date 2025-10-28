pipeline {
    agent any

    stages {
        stage('git Checkout Stage') {
            steps {
                git 'https://github.com/shubham93096/myweb.git'
            }
        }
        stage('maven build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker image build') {
            steps {
                sh 'sudo docker build . -t myimage_$BUILD_NUMBER'
            }
        }
        stage('Docker image tag and push') {
            steps {
                sh """
                  sudo docker tag myimage_$BUILD_NUMBER shubham7890/myimage_$BUILD_NUMBER
                  sudo docker push shubham7890/myimage_$BUILD_NUMBER
                   
                  """
            }
        }
        stage('Deployment image to new image') {
            steps {
                sh "sed -I 's|shubham7890/myimage_2|shubham7890/myimage_$BUILD_NUMBER|g' deployments.yml"
            }
        }
        stage('Kubernetes Deployment') {
            steps {
                sh "kubectl apply -f deployments.yml "
                sh "kubectl expose deployment  --port 8080 mywebdeployment --type=NodePort"
            }
        }
        
    }
}
