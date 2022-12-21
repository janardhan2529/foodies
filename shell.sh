 #!/bin/bash
  CHECK_TOMCAT_INSTALLATION=u02/middleware/apache-tomcat-9.0.70/
    sudo apt install -y openjdk-11-jdk
    CHECK_TOMCAT=$(cat /etc/passwd | cut -d ':' -f1 | grep 'tomcat' | wc -l)
    echo "$CHECK_TOMCAT"
    if [ $CHECK_TOMCAT -eq 0 ]; then
     echo "create user"
        sudo useradd -m -s /bin/bash tomcat
        fi
        if [ ! -d u02/middleware ]; then
         echo "directory not available pls create and go forther"
           mkdir -p u02/middleware


        fi
          if [ -d "$CHECK_TOMCAT_INSTALLATION" ]; then
                  echo "already exist"
          else
         echo "download"
         cd u02/middleware
           wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.70/bin/apache-tomcat-9.0.70.tar.gz
          tar -xvf apache-tomcat-9.0.70.tar.gz
           cd -
        fi
