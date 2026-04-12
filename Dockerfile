FROM tomcat:8.0.20-jre8
# Dummy text to test 
COPY target/appweb*.war /usr/local/tomcat/webapps/appweb.war

# Git webhook trigger demo
# TO test github push trigger
