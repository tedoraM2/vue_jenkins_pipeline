

pipeline {
    agent any

    options {
        timeout(time: 30, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    environment {
        NODE_ENV = 'production'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log --oneline -1'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm --version'
                sh 'node --version'
                // Ensure devDependencies (like `vite`) are installed even though
                // pipeline global NODE_ENV is set to 'production'. Use npm ci
                // with NODE_ENV overridden to development for reproducible installs.
                sh 'NODE_ENV=development npm ci'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
    }

    post {
        success {
            echo '✅ Build completed successfully!'
            archiveArtifacts artifacts: 'dist/**', allowEmptyArchive: true
        }
        failure {
            echo '❌ Build failed.'
        }
    }
}
