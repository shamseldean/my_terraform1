pipeline {
    agent any
    tools {
        // Use the Terraform tool defined in Jenkins global configuration
        terraform 'TerraformInstallationName'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                // Now Jenkins should find the Terraform executable
                sh 'terraform init'
            }
        }
        // Other stages...
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
