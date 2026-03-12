FROM --platform=linux/amd64 tomcat:9-jdk11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/HackMe.war /usr/local/tomcat/webapps/HackMe.war
EXPOSE 8080
