pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('Gunjan-aws-creds')
        // AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        // TF_IN_AUTOMATION      = '1'
    }

    stages {
        // stage('Checkout') {
        //     steps {
        //     checkout([$class: 'GitSCM', branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/gunjen03/tomcat-server.git']]])            

        //   }
        // }
        
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