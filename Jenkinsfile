pipeline {
    agent any

    triggers {
        githubPush()  // Automatically trigger on GitHub push
    }

    environment {
        BRANCH_NAME = "${env.BRANCH_NAME ?: 'main'}"
        REPO_URL = 'https://github.com/hafizsum/jenkins-cicd.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo "Checking out code from ${REPO_URL}, branch: ${BRANCH_NAME}"
                git branch: "${BRANCH_NAME}", url: "${REPO_URL}"
            }
        }

        stage('Prepare Scripts') {
            steps {
                script {
                    echo "Setting execute permissions on scripts if they exist..."
                    sh '''
                        [ -f build.sh ] && chmod +x build.sh
                        [ -f run-tests.sh ] && chmod +x run-tests.sh
                        [ -f deploy.sh ] && chmod +x deploy.sh
                    '''
                }
            }
        }

        stage('Build') {
            steps {
                echo "Building the code from branch: ${BRANCH_NAME}"
                sh './build.sh'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh './run-tests.sh'
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo "Deploying application from main branch..."
                sh './deploy.sh'
            }
        }
    }

    post {
        always {
            echo "Cleaning up after the pipeline run..."
        }
        success {
            echo "✅ Pipeline executed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs for errors."
        }
    }
}
