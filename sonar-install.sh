#!/bin/bash

#!/bin/bash

##: Author: Group8
##: Date: June 23, 2022
##: Description: Installation of Sonarqube on Centos7 server

echo "Installing Java-11"
sudo yum remove java 1.8* -y

if
 [ $? -eq 0 ]
then
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y

else
echo "java installation failed"
fi
echo " Download Sonarqube latest version on server"
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

echo "Extracting packages"
sudo yum install unzip -y
if
 [ $? -eq 0 ]
then
sudo unzip /opt/sonarqube-9.3.0.51899.zip
sudo unzip /opt/sonarqube-9.3.0.51899.zip -A

else
echo "unzip installation failled"
fi
##: Change ownership to user

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899.zip
if
 [ $? -eq 0 ]
then
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
else
echo "Sonarqube ownership change required"
fi
echo "Sonarqube will be installled next"
./sonar.sh start
./sonar.sh status

echo "Run ip -a in your terminal to check your ip address"
echo "Connect to Sonarqube server via your browser"
echo "Type http://<your-ip-address>:9000 in your browser"
