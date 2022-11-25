pipeline {
    agent any
    triggers {
        pollSCM('*/1 * * * *')
    }
    stages {
        stage('build-staging') {
            steps {
                script{
                    start("Build", "STAGE")
                    sh "docker build --no-cache -t sandismalisevs/mvn_tests:latest ."
                }
            }
            post {
                success {
                    script{
                        notification("staging", "build", "0")
                    }
                }
                failure {
                    script{
                        notification("staging", "build", "1")
                    }
                }
            }
        }
        stage('deploy-staging') {
            steps {
                script{
                    start("Deployment", "STAGE")
                }
            }
            post {
                success {
                    script{
                        notification("staging", "deployment", "0")
                    }
                }
                failure {
                    script{
                        notification("staging", "deployment", "1")
                    }
                }
            }
        }
        stage('test-staging') {
            steps {
                script{
                    test("STAGE")
                }
            }
            post {
                success {
                    script{
                        notification("staging", "test", "0")
                    }
                }
                failure {
                    script{
                        notification("staging", "test", "1")
                    }
                }
            }
        }
        stage('build-production') {
            steps {
                script{
                    start("Build", "PROD")
                    sh "docker build --no-cache -t sandismalisevs/mvn_tests:latest ."
                }
            }
            post {
                success {
                    script{
                        notification("prod", "build", "0")
                    }
                }
                failure {
                    script{
                        notification("prod", "build", "1")
                    }
                }
            }
        }
        stage('deploy-production') {
            steps {
                script{
                    start("Deployment", "PROD")
                }
            }
            post {
                success {
                    script{
                        notification("prod", "deployment", "0")
                    }
                }
                failure {
                    script{
                        notification("prod", "deployment", "1")
                    }
                }
            }
        }
        stage('test-production') {
            steps {
                script{
                    test("PROD")
                }
            }
            post {
                success {
                    script{
                        notification("prod", "test", "0")
                    }
                }
                failure {
                    script{
                        notification("prod", "test", "1")
                    }
                }
            }
        }
    }
}

def start(String stage, String environment){
    echo "${stage} on ${environment} environment started..."
}

def test(String environment){
    echo "Testing on ${environment} environment..."
    sh "docker compose up"
    
}

def notification(String environment, String stage, String result) {
    sh "bash send_notification.sh '${environment} ${stage}' ${result}"
}
