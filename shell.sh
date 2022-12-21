 #!/bin/bash
 sudo apt update -y
CHECK_TOMCAT_INSTALLATION=/u02/middleware/apache-tomcat-9.0.70/
    sudo apt install -y openjdk-11-jdk
    CHECK_TOMCAT=$(cat /etc/passwd | cut -d ':' -f1 | grep 'tomcat' | wc -l)
    echo "$CHECK_TOMCAT"
    if [ $CHECK_TOMCAT -eq 0 ]; then
     echo "create user"
        sudo useradd -m -s /bin/bash tomcat
        fi
    function checkDirectory(){
        if [ ! -d /u02/middleware ]; then
         echo "directory not available pls create and go forther"
          sudo mkdir -p /u02/middleware
           sudo chown -R tomcat:tomcat /u02

        fi
    }
 function tomcatInstall(){
          if [ -d "$CHECK_TOMCAT_INSTALLATION" ]; then
                  echo "already exist"
          else
         echo "download"
          sudo su tomcat bash -c "wget --content-disposition https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.70/bin/apache-tomcat-9.0.70.tar.gz -P /u02/middleware"
          fi

}
function tomcatExtract(){
        if [ -d "$CHECK_TOMCAT_INSTALLATION" ]; then
                echo "tomcat already existing"
        else
                echo "extarct zip"
                cd /u02/middleware
                 sudo gunzip apache-tomcat-9.0.70.tar.gz
                sudo tar -xvf apache-tomcat-9.0.70.tar
                sudo rm -rf apache-tomcat-9.0.70.tar
                cd -
        fi
}
 checkDirectory
 tomcatInstall
 tomcatExtract
