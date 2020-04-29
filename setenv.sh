#!/bin/sh

#JAVA VM HOME
#export -s JAVA_HOME=/QOpenSys/QIBM/ProdData/JavaVM/jdk70/64bit/

#JVM Heap Size 
#export JAVA_OPTS="$JAVA_OPTS -server -Xms512m -Xmx512m"

#ConnectzNow SOAP Metro Factory Classes Environments
export JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8 -Djavax.xml.soap.MessageFactory=com.sun.xml.internal.messaging.saaj.soap.ver1_1.SOAPMessageFactory1_1Impl -Djavax.xml.soap.SOAPFactory=com.sun.xml.internal.messaging.saaj.soap.ver1_1.SOAPFactory1_1Impl -Djavax.xml.soap.SOAPConnectionFactory=com.sun.xml.internal.messaging.saaj.client.p2p.HttpSOAPConnectionFactory -Djavax.xml.soap.MetaFactory=com.sun.xml.internal.messaging.saaj.soap.SAAJMetaFactoryImpl"

#ConnectzNow Run Environment Variables
export -p SIBSWS_HOME_ACSM=/usr/local/tomcat/sibsws/
export -p SIBSWS_APPID=default
export -p SIBSWS_HOME_EPF=/usr/local/tomcat/sibsws/
export -p SIBSWS_APPID_DAEMON=EB
export -p SIBSWS_APPID_FD=FD
