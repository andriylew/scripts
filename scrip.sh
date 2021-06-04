#!/bin/sh
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz  
tar -xf apache-tomcat-9.0.46.tar.gz
mkdir /root/web
sudo mv apache-tomcat-9.0.46 /root/web
##nano .bshr
echo 'export CATALINA_HOME=/root/web/apache-tomcat-9.0.46'  >> .bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk' >> .bashrc
path="/root/web/apache-tomcat-9.0.46/conf/tomcatusers.xml"
change_str="</tomcat-users>"
text="<role rolename="manager-gui"/>"
sed -i 's/</tomcat-users>/'$change_str'/g' $path
echo '<user username="admin" password="password" roles="manager-gui"/>' >>$path
echo $change_str>>$path
sh /root/web/apache-tomcat-9.0.46/bin/startup.sh
