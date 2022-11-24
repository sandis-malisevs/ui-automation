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
        }
        stage('deploy-staging') {
            steps {
                script{
                    deploy("STAGE")
                }
            }
        }
        stage('test-staging') {
            steps {
                script{
                    test("STAGE")
                }
            }
        }
        stage('build-production') {
            steps {
                script{
                    build("PROD")
                }
            }
        }
        stage('deploy-production') {
            steps {
                script{
                    deploy("PROD")
                }
            }
        }
        stage('test-production') {
            steps {
                script{
                    test("PROD")
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
    echo "Testing on ${environment} environment started..." . // I Guess not needed

}