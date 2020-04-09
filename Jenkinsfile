pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'ping -n 4 google.com'
      }
    }

    stage('Test') {
      steps {
        sh 'ping -n 2 google.com'
      }
    }

    stage('Deliver') {
      steps {
        sh 'ping -n 3 google.com'
      }
    }

  }
}