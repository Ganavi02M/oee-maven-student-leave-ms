pipeline {

    agent any

    tools {

        maven 'Maven'
        jdk 'JDK21'

    }

    environment {

        DOCKER_IMAGE = "ganavi02m/leave-management-system"

    }

    stages {

        stage('Checkout') {

            steps {

                git branch: 'main',
                credentialsId: 'github-credentials',
                url: 'https://github.com/Ganavi02M/oee-maven-student-leave-ms.git'

            }

        }

        stage('Build') {

            steps {

                sh 'mvn clean compile'

            }

        }

        stage('Test') {

            steps {

                sh 'mvn test'

            }

        }

        stage('Package') {

            steps {

                sh 'mvn clean package'

            }

        }

        stage('Docker Build') {

            steps {

                sh 'docker build -t $DOCKER_IMAGE:latest .'

            }

        }

        stage('DockerHub Login') {

            steps {

                withCredentials([usernamePassword(

                    credentialsId: 'dockerhub-credentials',

                    usernameVariable: 'DOCKER_USER',

                    passwordVariable: 'DOCKER_PASS'

                )]) {

                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'

                }

            }

        }

        stage('DockerHub Push') {

            steps {

                sh 'docker push $DOCKER_IMAGE:latest'

            }

        }

    }

    post {

        success {

            emailext(

                subject: "SUCCESS: Jenkins Build ${BUILD_NUMBER}",

                body: """
                Build Successful
                
                Project: Student Leave Management System
                
                GitHub Repo:
                https://github.com/Ganavi02M/oee-maven-student-leave-ms.git
                
                Docker Image:
                ganavi02m/leave-management-system:latest
                """,

                to: 'ganavimganavi02@gmail.com'

            )

        }

        failure {

            emailext(

                subject: "FAILED: Jenkins Build ${BUILD_NUMBER}",

                body: """
                Build Failed
                
                Check Jenkins Console Output.
                """,

                to: 'ganavimganavi02@gmail.com'

            )

        }

    }

}
