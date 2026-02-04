

pipeline {
    agent any

    options {
        timeout(time: 30, unit: 'MINUTES')
    }

    environment {
        NODE_ENV = 'production'
        DOCKER_BUILDKIT = '1'
        IMAGE_NAME = 'vue-jenkins-pipeline'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'echo "Build started for Vue Jenkins Pipeline"'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'echo "Building Docker image..."'
                sh 'docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .'
                sh 'docker build -t ${IMAGE_NAME}:latest .'
                sh 'echo "Docker image built: ${IMAGE_NAME}:${BUILD_NUMBER}"'
            }
        }

        stage('Test Build') {
            steps {
                sh 'echo "Testing Docker image..."'
                sh '''
                    CONTAINER_ID=$(docker run -d -p 3002:3000 ${IMAGE_NAME}:${BUILD_NUMBER})
                    sleep 3
                    STATUS=$(curl -s http://localhost:3002 | wc -l)
                    if [ "$STATUS" -gt 0 ]; then
                        echo "✅ Container is responding"
                    else
                        echo "❌ Container health check failed"
                        exit 1
                    fi
                    docker kill $CONTAINER_ID || true
                '''
            }
        }
    }

    post {
        success {
            sh 'echo "✅ Build completed successfully!"'
            archiveArtifacts artifacts: 'dist/**', allowEmptyArchive: true
        }
        failure {
            sh 'echo "❌ Build failed."'
        }
        always {
            cleanWs()
        }
    }
}
