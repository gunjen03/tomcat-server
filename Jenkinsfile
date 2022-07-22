pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/gunjen03/tomcat-server.git']]])            

          }
        }
        
        stage ("terraform init") {
            steps {
                sh ('terraform init --reconfigure -lock=false') 
            }
        }
        
        // stage ("terraform Action") {
        //     steps {
        //         echo "Terraform action is --> ${action}"
        //         sh ('terraform ${action} --auto-approve') 
        //    }
        // }
    }
}