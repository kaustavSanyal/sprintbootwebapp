pipeline {
  agent any
  tools {
      maven 'maven3.6.0'
      jdk 'java1.8.0'
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
         stage ('Test')
           {
            steps
               {
                sh 'mvn test'
                }
                            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
             }      
        stage('Publish') {
   steps {
    sh 'curl -X PUT -u admin:AP68asDSgBSmSfbJHrtgYq3gLjp -T target/sprintbootwebapp-0.0.1-SNAPSHOT.jar "http://104.45.150.91:8081/artifactory/example-repo-local/my-app-1.0-SNAPSHOT.jar"'
   }
  }
         stage ('Deploy')
       {
      steps
      {
       //sh 'java -jar target/sprintbootwebapp-0.0.1-SNAPSHOT.jar'
        echo "Deploying"
      }
      }


 }
}
