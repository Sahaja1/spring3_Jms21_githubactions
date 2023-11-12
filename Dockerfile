FROM tomcat:8
COPY target/spring3_Jms21_githubactions.war /usr/local/tomcat/webapps/spring3.war
