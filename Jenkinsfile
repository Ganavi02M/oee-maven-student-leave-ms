pipeline {

```
agent any

tools {
    maven 'Maven'
    jdk 'JDK21'
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
}

post {

    success {
        emailext(
            subject: "SUCCESS: Jenkins Build ${BUILD_NUMBER}",
            body: "Build Successful | Job: ${JOB_NAME} | Build Number: ${BUILD_NUMBER}",
            to: 'ganavimganavi02@gmail.com'
        )
    }

    failure {
        emailext(
            subject: "FAILED: Jenkins Build ${BUILD_NUMBER}",
            body: "Build Failed | Job: ${JOB_NAME} | Build Number: ${BUILD_NUMBER}",
            to: 'ganavimganavi02@gmail.com'
        )
    }
}
```

}
