pipeline {
    agent any

        stage('maven build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker image build') {
            steps {
                sh 'docker build . -t myimage_$BUILD_NUMBER'
            }
        }
        stage('Docker image tag and push') {
            steps {
                sh """
                  docker tag myimage_$BUILD_NUMBER ashishsutar/myimage_$BUILD_NUMBER
                  docker push ashishsutar/myimage_$BUILD_NUMBER
                   
                  """
            }
        }
        stage('Deployment image to new image') {
            steps {
                sh "sed -i 's|ashishsutar/myimage ashishsutar/myimage_$BUILD_NUMBER|g' deployments.yml"
            }
        }
        stage('Kubernetes Deployment') {
            steps {
                sh "kubectl apply -f deployments.yml "
                sh "kubectl expose deployment  --port 8080 mywebdeployment --type=NodePort"
            }
        }
        
    }
