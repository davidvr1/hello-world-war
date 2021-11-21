pipeline {
  agent {
    node {
      label 'centos7'
    }

  }
  stages {
    stage('Checkout Code') {
      steps {
        script {
          env.stepLevel = 'Checkout Code'
        }

        git(url: 'https://github.com/davidvr1/hello-world-war.git', branch: 'dev', credentialsId: 'github', changelog: true, poll: true)
      }
    }

    stage('mvn build') {
      steps {
        script {
          env.stepLevel = 'mvn build'
        }

        sh '''cd hello-world-war
echo $BUILD_ID
mvn compile'''
      }
    }

    stage('test the app') {
      steps {
        script {
          env.stepLevel = 'test the app'
        }

        sh '''cd hello-world-war 
mvn sonar:sonar -Dsonar.host.url=http://<IP address>:8081 -Dlicense.skip=true'''
      }
    }

    stage('packging') {
      steps {
        script {
          env.stepLevel = 'packging'
        }

      }
    }

  }
  environment {
    foo = 'nothing'
  }
}