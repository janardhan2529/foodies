pipeline{
    agent{
        label 'jenkinsslave2'
    }
    tools{
        maven '3.8.6'
    }
    options{
        timestamps()
        timeout(time:1, unit: 'HOURS')
    }
    triggers{
        pollSCM('*/1 * * * * ')
    }
    stages{
        stage('checkout'){
            steps{
            git credentialsId: 'gitclone', url: 'https://github.com/janardhan2529/foodies.git'
            }
        }
            stage('test-cases'){
                steps{
                sh (script: 'mvn --batch-mode -Dmaven-test-failed.ignore=ture test')
            }
        }
        stage('build'){
            steps{
            sh '''mvn --batch-mode package -Dskiptests'''
            }
        }
        stage('installtions'){
            steps{
               sh '''
                     cp -R /u01/jenkins/workspace/foodies/shell.sh /home/vagrant
                     sudo chmod u+x /home/vagrant/shell.sh
                     cd /home/vagrant
                       ./shell.sh
                      cd -
                        sudo cp -R /u01/jenkins/workspace/foodies/src/main/tomcat.service /etc/systemd/system/tomcat.service
                        sudo systemctl daemon-reload
                        sudo systemctl restart tomcat
                        
               '''
            }
        }
        stage('deploy'){
            steps{
                sh '''
                sudo cp -R /u01/jenkins/workspace/foodies/target/foodies.war /home/vagrant/u02/middleware/apache-tomcat-9.0.70/webapps/
                        sudo systemctl restart tomcat
                '''
                echo "**********************deploy completed**********************"
            }
        }
    }
}
