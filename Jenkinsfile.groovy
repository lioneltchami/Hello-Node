pipeline {
    agent any
    environment {
        PROJECT_ID = 'bold-physics-383802'
        CLUSTER_NAME = 'cluster-1'
        LOCATION = 'us-central1-c'
        CREDENTIALS_ID = 'bold-physics-383802'
    }

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
                sh "docker build -t apotieri/app_maven_001 ."
            }
        }
        stage('DOCKER PUSH') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'pwd', usernameVariable: 'user')]) {
                   sh  "docker login -u ${user} -p ${pwd}"
                   sh "docker push apotieri/app_maven_001"
                    }                    
            }
        }
       stage('Deploy to kubernetes'){
        steps{
            
            step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'petclinic.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
		       echo "Deployment Finished ..."
        }
       }
    }
}
