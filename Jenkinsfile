pipeline {
    agent any
    triggers {
        pollSCM('*/1 * * * *')
    }
    stages {
        stage('build-staging') {
            steps {
                script{
                    build("STAGE")
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
                    deploy("STAGE")
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
                    build("PROD")
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
                    deploy("PROD")
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

def build(String environment){
    echo "Build on ${environment} environment started..."
}

def deploy(String environment){
    echo "Deployment on ${environment} environment started..."
}

def test(String environment){
    echo "Testing on ${environment} environment started..." // I Guess not needed
}

def notification(String environment, String stage, String result) {
    bash 'send_notification.sh “${environment} ${stage}” ${result}'
}
