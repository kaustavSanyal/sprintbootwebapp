pipeline {
   environment {
    registry = "kaustavdocker/dockerimage"
    registryCredential = 'dockerhub'
    dockerImage = ''
    containerId = sh(script: 'docker ps -aqf "name=java-app"', returnStdout: true) //to store your container id , so that it can be deleted
  }
  agent any
  tools {
      maven 'maven3.6.0'  //we have given this tools in global config , we are saying that you should use these tools
      //jdk 'java1.8.0'
    }
    stages 
    {
      stage('Build') 
      {
       steps 
       {
        sh "mvn -B -DskipTests clean package"
        }
      }
         //stage ('Test')
        //   {
         //   steps
          //     {
           //     sh 'mvn test'
              //  }
//              post {
           //     always {
               //     junit 'target/surefire-reports/*.xml'
        //        }
       //     }
       //      }      
     //   stage('Publish') {
  // steps {
//    sh 'curl -X PUT -u admin:AP68asDSgBSmSfbJHrtgYq3gLjp -T target/sprintbootwebapp-0.0.1-SNAPSHOT.jar "http://104.45.150.91:8081/artifactory/example-repo-local/my-app-1.0-SNAPSHOT.jar"'
//   }
//  }
   //      stage ('Deploy')
   //    {
  //    steps
  //    {
   //    sh 'java -jar target/sprintbootwebapp-0.0.1-SNAPSHOT.jar'
   //   }
  //    }
     
       stage('Push Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
      
      stage('Cleanup') {
      when {
                not { environment ignoreCase: true, name: 'containerId', value: '' }
        }
      steps {
        sh 'docker stop ${containerId}'
        sh 'docker rm ${containerId}'
      }
    }
    stage('Run Container') {
      steps {
        sh 'docker run --name=java-app --privileged -d -p 3030:3030 -v /var/run/docker.sock:/var/run/docker.sock $registry:$BUILD_NUMBER &'
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi -f $registry:$BUILD_NUMBER"
      }
    }


 }
}
