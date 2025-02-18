pipeline{
    agent any
    environment {
        TF_VAR_region = 'us-east-1'
        TF_VAR_cost_limit = '0'
    }
    stages{
        stage("Terraform init"){
            steps{
                script{
                    sh 'terraform init'
                }
            }
        }
        stage("Terraform plan"){
            steps{
                script{
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage("Approval"){
            when {
                anyOf {
                    branch 'main'
                    branch 'dev'
                    branch 'prod'
                }
            }
            steps{
                input message: 'Approve deployment?', ok: 'Deploy'
            }
        }
        stage('Terraform Apply') {
            when {
                anyOf {
                    branch 'main'
                    branch 'dev'
                    branch 'prod'
                }
            }
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

    }
    post{
        always{
            sh 'rm -f tfplan'
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}