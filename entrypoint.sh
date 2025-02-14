#!/bin/sh

echo "server-port=${SERVER_PORT}" > server.properties
echo "server-ip=${SERVER_IP}" >> server.properties
echo "online-mode=${ONLINE_MODE}" >> server.properties
echo "max-players=${MAX_PLAYERS}" >> server.properties
echo "gamemode=${GAMEMODE}" >> server.properties
echo "difficulty=${DIFFICULTY}" >> server.properties
echo "pvp=${PVP}" >> server.properties
echo "spawn-monsters=${SPAWN_MONSTERS}" >> server.properties
echo "allow-nether=${ALLOW_NETHER}" >> server.properties
echo "enable-command-block=${ENABLE_COMMAND_BLOCK}" >> server.properties

java -Xmx1024M -Xms1024M -jar server.jar nogui
