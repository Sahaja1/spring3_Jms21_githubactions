pipeline {
 agent any
  environment {
     registry = "Sahaja1/${projectName}"
     registryCrdentials = 'dockerhub_credentials'
	 dockerImage=''
  }
  tools {
    maven "maven3"
  }
  stages {
    stage('get scm') {
      steps {
	  git credentialsId: 'github_credentials', url: 'https://github.com/Sahaja1/spring3_Jms21_githubactions.git'
       }
    }
	  stage('mavenbuild'){
	   steps{
	    sh 'mvn package'
	   }
	   }
	  stage('Building image') {
       steps{
        script {
         dockerImage = docker.build registry +":$BUILD_NUMBER"
        }
       }
      }
     stage('Pushing to dockerhub') {
      steps{ 
       script {
        docker.withRegistry('',registryCrdentials)
         {
          dockerImage.push()
         }
        }
       }
      }
     stage('remove old docker images') {
      steps{ 
       sh "docker rmi $REPOSITORY:v$BUILD_NUMBER"
      }
     }
    }
  }
