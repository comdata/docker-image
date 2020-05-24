pipeline {
    environment {
        registry = "comdata456/docker-image"
        registryCredential = 'docker-hub-credentials'
    }

  triggers {
        cron('H 1 * * *')
        pollSCM('H */1 * * *')
    }

    agent {
        docker {
            image 'comdata456/maven-jdk-11-slim' 
            args '-v /run/docker.sock:/run/docker.sock -v /usr/bin/docker:/usr/bin/docker' 
        }
    }



    stages {
        
        stage('Make Container') {

            steps {
                sh "/usr/bin/docker build -t comdata456/docker-image:${env.BUILD_ID} ."
                sh "/usr/bin/docker tag comdata456/docker-image:${env.BUILD_ID} comdata456/docker-image:latest"
            }
        }
    }

    post {

        success {
            withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh "/usr/bin/docker login -u ${USERNAME} -p ${PASSWORD}"
                sh "/usr/bin/docker push comdata456/docker-image:${env.BUILD_ID}"
                sh "/usr/bin/docker push comdata456/docker-image:latest"
            }
        }
    }
}
