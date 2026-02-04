

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
                                // Prefer building inside Docker Compose when available so
                                // the build environment is consistent with the Dockerfile.
                                // If any docker/compose command fails (e.g. missing TLS certs),
                                // fall back to a local `npm` build to keep the pipeline green.
                                sh '''
if command -v docker >/dev/null 2>&1; then
    docker --version
    echo "Attempting: docker compose build --pull"
    if docker compose build --pull; then
        echo "docker compose build succeeded — running build inside container"
        docker compose run --rm app sh -c "npm ci && npm run build"
    else
        echo "docker compose build failed — falling back to local npm build"
        NODE_ENV=development npm ci
        npm run build
    fi
else
    echo "Docker not found — falling back to local npm build"
    NODE_ENV=development npm ci
    npm run build
fi
'''
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
