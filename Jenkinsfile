

pipeline {
    agent any

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

        stage('Install Dependencies') {
            steps {
                sh 'echo "Installing dependencies..."'
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
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
        always {
            deleteDir()
        }
    }
}
