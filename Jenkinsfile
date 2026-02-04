

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
                sh 'npm install'
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
