FROM openjdk:21-jdk

WORKDIR /app

COPY server.jar eula.txt server.properties ./

RUN chmod +x server.jar

EXPOSE 25565

CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
