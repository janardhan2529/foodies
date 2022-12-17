pipeline{
    agent any
    triggers{
        pollSCM('*/2 * * * *')
    }
    stages{
        stage('pollscm'){
            steps{
                echo "every new commit"
            }
        }

    }
}
