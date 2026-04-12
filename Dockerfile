FROM tomcat:9-jdk17
# Dummy text to test 
COPY target/*.war /usr/local/tomcat/webapps/appweb.war

# Git webhook trigger demo
# TO test github push trigger
