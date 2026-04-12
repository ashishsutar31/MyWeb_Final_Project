FROM tomcat:8.0.20-jre8
# Dummy text to test 
COPY target/AppWeb*.war /usr/local/tomcat/webapps/AppWeb.war

# Git webhook trigger demo
# TO test github push trigger
