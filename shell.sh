 #!/bin/bash
 
    function checkDirectory(){
        if [ -d /u02/middleware ]; then
            echo "directory already available current agent node"
        else
         echo "directory not available pls create and go forther"
          mkdir -p /u02/middleware
         sudo chown -R vagrant:vagrant /u02/middleware

        fi
    }
function checkTomcatServer(){
    CHECK_TOMCAT=$(cat /etc/passwd | cut -d ':' -f1 | grep 'tomcat')
    if [[ $CHECK_TOMCAT == *"tomcat"* ]]; then
    echo "user already existed"
    else
     echo "create user"
        sudo useradd -m -s /bin/bash tomcat
        fi
 }
 function tomcatInstall(){
    sudo su tomcat bash -c "wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.70/bin/apache-tomcat-9.0.70-fulldocs.tar.gz -o /u02/middleware/apache-tomcat-9.0.70-fulldocs.tar.gz"

 }
 sudo apt update -y
 installjdk
 checkDirectory
 checkTomcatServer
 tomcatInstall
