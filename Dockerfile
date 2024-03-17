FROM openjdk
COPY target/*.war /
EXPOSE 8080
ENTRYPOINT ["java" , "-jar" , "/sparkjava-hello-world-1.0.war"]
