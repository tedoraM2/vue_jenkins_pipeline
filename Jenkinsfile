

pipeline {
    agent any

    options {
        timestamps()
        timeout(time: 30, unit: 'MINUTES')
    }

    environment {
        NODE_ENV = 'production'
        DOCKER_BUILDKIT = '1'
    }

    parameters {
        choice(name: 'BUILD_TYPE', choices: ['local', 'docker'], description: 'Build using local Node or Docker')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                script {
                    echo "📦 Building with: ${params.BUILD_TYPE}"
                }
            }
        }

        stage('Build Local') {
            when {
                expression { params.BUILD_TYPE == 'local' }
            }
            tools {
                nodejs 'node22'
            }
            steps {
                echo '🔨 Building with local Node'
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Build Docker') {
            when {
                expression { params.BUILD_TYPE == 'docker' }
            }
            steps {
                echo '🐳 Building with Docker'
                script {
                    sh 'docker build -t vue-jenkins-pipeline:${BUILD_NUMBER} .'
                    sh 'docker build -t vue-jenkins-pipeline:latest .'
                }
            }
        }

        stage('Test') {
            when {
                expression { params.BUILD_TYPE == 'local' }
            }
            steps {
                echo '✅ Running tests'
                sh 'npm test || true'
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
        always {
            cleanWs()
        }
    }
}
