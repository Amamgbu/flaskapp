## Introduction
CI/CD deployment of simple flask app using docker and Jenkins.


## Approach
For this task, a Jenkins CI/CD pipeline is setup using declarative syntax and makes use of docker. In order to deploy this flask app, a Jenkins file is created. The jenkins file performs the following tasks:
- Lint dockerfile to ensure no errors in Dockerfile
- If linting is successful, build docker image and tag.
- List all running docker containers if any and stop the service. This is useful when redeployment is done so that port connection issues would not arise.
- Deploy docker container in background process. This is so that docker run command does not run indefinitely on Jenkins and use up CPU of server. 


## Installation
This task makes use of a cloud VM. I chose AWS and made use of Ubuntu 22.04 lts ec2 instance. Follow the steps below to install jenkins on server and docker as well.

### Jenkins:
To install jenkins on ubuntu
```
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo systemctl start jenkins.service
sudo systemctl status jenkins
sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw enable
```
- Log into http://<url>:8080 and set password
- Install Blue Oceans Plugin

### Docker:
```
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
sudo usermod -aG docker jenkins
```

### Hadolint:
```wget -0 /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64
chmod +x /bin/hadolint
```


### Deployment
- Create a blue ocean github pipeline. Add authorization token. Make sure Jenkinsfile is in base directory of github.
- Once pipeline is done building, go to pipeline settings, increase periodic run to after 1 mins. This is so that pipeline regularly checks for updates.
- You can now view your deployed url at http://url:5000


## Result
Jenkins url: http://<url>:8080
Application url: http://<url>:5000