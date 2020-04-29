FROM tomcat:8.5
ADD tomcat-users.xml /usr/local/tomcat/conf/
ADD catalina.properties /usr/local/tomcat/conf/
ADD setenv.sh /usr/local/tomcat/bin/
ADD libczn /usr/local/tomcat/libczn/
ADD sibsws /usr/local/tomcat/sibsws/
ADD webapps /usr/local/tomcat/webapps/
ADD sibs.ws.service.epf.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]