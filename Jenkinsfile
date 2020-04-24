pipeline {
    agent {
        dockerfile {
            filename 'jenkinsAgent.Dockerfile'
            additionalBuildArgs  '--build-arg JENKINSUID=`id -u jenkins` --build-arg JENKINSGID=`id -g jenkins` --build-arg DOCKERGID=`stat -c %g /var/run/docker.sock`'
            args '-v /var/jenkins_home/node_modules:/usr/src/app/node_modules -v /var/run/docker.sock:/var/run/docker.sock -u jenkins:docker'
        }
    }
    environment { 
        CI = 'true'
        HOME = '.'
        registry = "kodifiera/react-ci-test"
        registryCredential = 'docker-hub-credentials'
        dockerImage = ''
    }
    stages {
        stage('Init') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Staging') {
            when {
                branch 'Development'
            }
            steps {
                script {
                    sh 'echo ============================='
                    sh 'echo ===  NOT YET IMPLEMENTED  ==='
                    sh 'echo Build from local docker image'
                    sh 'echo ============================='
                }
            }
        }
        stage('Deliver') {
            when {
                branch 'Production'
            }
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}