pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('Gunjan-aws-creds')
    }

    parameters {
        booleanParam(defaultValue: false, description: 'Set Value to True to Initiate Destroy Stage', name: 'destroy')
    }

    stages {
        
        stage ("terraform init") {
            steps {
                sh ('terraform init --reconfigure -lock=false') 
            }
        }

        stage('terraform plan') {
            when {
                expression { !params.destroy }
            }
            steps {
                echo "Terraform plan is ready for review"

                sh ('terraform plan -var-file=environments/dev.tfvars')

            }
        }
    }
}