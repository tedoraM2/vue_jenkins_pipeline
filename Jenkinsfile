

pipeline {
    agent {
        docker {
            image 'node:22-alpine'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    options {
        timeout(time: 30, unit: 'MINUTES')
    }

    environment {
        NODE_ENV = 'production'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'echo "Build started for Vue Jenkins Pipeline"'
            }
        }

        stage('Install & Build') {
            steps {
                sh 'echo "Installing dependencies..."'
                sh 'npm install'
                sh 'echo "Building application..."'
                sh 'npm run build'
                sh 'echo "Build completed"'
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
    }
}
