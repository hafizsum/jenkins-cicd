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
                git branch: 'main', url: 'https://github.com/hafizsum/jenkins-cicd.git'
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
}
