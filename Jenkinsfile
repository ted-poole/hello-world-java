pipeline {
   agent { label 'docker' }

   triggers {
       upstream(upstreamProjects: 'services-base/latest', threshold: hudson.model.Result.SUCCESS)
   }

   environment {
       IMAGE_NAME="adlinktech/${JOB_NAME.replace('/',':')}"
   }

   stages {
      stage('Build') {
         steps {
            sh 'docker build --pull -t ${IMAGE_NAME} .'
         }
      }
      stage('Push') {
         steps {
            sh 'docker push ${IMAGE_NAME}'
         }
      }
   }
}
