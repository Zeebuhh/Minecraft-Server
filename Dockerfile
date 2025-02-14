FROM openjdk:21-jdk

WORKDIR /app

COPY server.jar eula.txt ./  
COPY entrypoint.sh /entrypoint.sh  

RUN chmod +x ./entrypoint.sh

EXPOSE 25565

ENTRYPOINT ["/entrypoint.sh"]
