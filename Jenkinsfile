pipeline {
    agent any
    // environment {
    //     PROJECT_ID = 'bold-physics-383802'
    //     CLUSTER_NAME = 'cluster-1'
    //     LOCATION = 'us-central1-c'
    //     CREDENTIALS_ID = 'bold-physics-383802'
    // }

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
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
                sh "docker build -t apotieri/app_maven_007 -f /var/jenkins_home/workspace/mavenbuild2/Dockerfile /var/jenkins_home/workspace/mavenbuild2"
            }
        }
        stage('DOCKER PUSH') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerid', passwordVariable: 'pwd', usernameVariable: 'usr')]) {
                   sh "docker login -u ${usr} -p ${pwd}"
                   sh "docker push apotieri/app_maven_007"
                    }                    
            }
        }
    }
}
