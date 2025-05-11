pipeline {
    agent any

    triggers {
        githubPush()  // Triggers build on GitHub push
    }

    environment {
        BRANCH_NAME = "${env.GIT_BRANCH ?: 'main'}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo "Checking out code from GitHub repository: ${env.GIT_URL}"
                git branch: 'main', url: 'https://github.com/hafizsum/jenkins-cicd.git'
            }
        }

        stage('Prepare Scripts') {
            steps {
                script {
                    // Make sure build.sh, run-tests.sh, and deploy.sh are executable
                    echo "Setting execute permissions on scripts..."
                    sh 'chmod +x ./build.sh ./run-tests.sh ./deploy.sh'
                }
            }
        }

        stage('Build') {
            steps {
                echo "Building the code from branch: ${BRANCH_NAME}"
                // Replace with your actual build command
                sh './build.sh'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                // Replace with your test command
                sh './run-tests.sh'
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo "Deploying application..."
                // Replace with your deployment command
                sh './deploy.sh'
            }
        }
    }

    post {
        always {
            echo "Cleaning up after the pipeline run..."
            // You can add any cleanup steps here if needed
        }
        success {
            echo "Pipeline executed successfully!"
        }
        failure {
            echo "Pipeline failed. Check the logs for details."
        }
    }
}
