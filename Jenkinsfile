pipeline {
    agent any
    environment{
        dockerImage = ""
    }
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
                script{
                sh "docker build -t flask-app-$BUILD_NUMBER"
                    }
            }
                }
        stage('Stop running docker containers'){
            steps {
            script{
            try{
                sh 'docker ps -q | xargs docker stop'
            }
            catch(all){
                sh "echo 'no container running' " 
            }

            }
        }
        }
        stage('Run docker container'){
            steps{
                sh "docker run -p 5000:5000 "+dockerImage+" ."
            }
        }

        }
    }