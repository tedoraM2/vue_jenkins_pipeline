

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

        stage('Install & Build') {
            steps {
                sh 'echo "Building with Docker container..."'
                script {
                    sh '''
                        docker run --rm -v $PWD:/app -w /app node:22-alpine sh -c "npm install && npm run build"
                    '''
                }
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
