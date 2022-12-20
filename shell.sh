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
 sudo apt update -y
 checkDirectory
 checkTomcatServer
 tomcatInstall
