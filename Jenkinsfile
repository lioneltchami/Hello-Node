pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M2_HOME"
    }

    stages {
        stage('GIT CHECKOUT') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/apotitech/Hello-Node.git'
            }
        }
        stage('MAVEN BUILD') {
            steps {
                // Get some code from a GitHub repository
                sh "mvn clean install package"
            }
        }
        stage('DOCKER BUILD') {
            steps {
                // Get some code from a GitHub repository
                sh "docker build -t apotieri/app_maven_001 ."
            }
        }
        stage('DOCKER PUSH') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'pwd', usernameVariable: 'user')]) {
                   sh  "docker login -u ${user} -p ${pwd}"
                    }

                // Get some code from a GitHub repository
                    sh "docker push apotieri/app_maven_001"
            }
        }
        stage('DOCKER DEPLOY') {
            steps {
                    ansiblePlaybook credentialsId: 'dev', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dev.inv', playbook: 'deploy-docker.yaml'
            }
        }
    }
}
