FROM tomcat:8.5.43-jdk8
COPY  /hello-world-war/target/hello-world-war-1.0.0.war $CATALINA_HOME/webapps/hello-world-war-1.0.0.$EXPOSE 8080
