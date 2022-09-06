pipeline {
    agent any
    stages{
        stage('Lint Dockerfile') {
            steps {
                script{
                    try{
                        sh "make lint"
                        }
                    catch(all){
                        sh "echo 'linting fail' "
                        }
                  }
              }
         }
         stage('Build docker image and Tag image') {
            steps {
                dockerImage = docker.build("flask-app-$BUILD_NUMBER")
                    }
                }
        stage('Stop running docker containers'){
            try{
                sh 'docker ps -q | xargs docker stop'
            }
            catch(all){
                sh "echo 'no container running' " 
            }

        }
        stage('Run docker container'){
            steps{
                sh "docker run -p 5000:5000 "+dockerImage+" ."
            }
        }

        }
    }