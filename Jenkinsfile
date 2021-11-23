pipeline {
  agent any
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
      parallel {
        stage('mvn build') {
          steps {
            script {
              env.stepLevel = 'mvn build'
            }

          }
        }

        stage('build') {
          steps {
            sh '''echo $BUILD_ID
pwd
ls -alh
chmod 400 pom.xml
mvn   clean package'''
          }
        }

      }
    }

    stage('test the app') {
      steps {
        script {
          env.stepLevel = 'test the app'
        }

        sh '''cd hello-world-war 
mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dlicense.skip=true'''
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
