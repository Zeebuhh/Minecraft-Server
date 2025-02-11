# Minecraft Server

## Table of Contents

1. [Description](#description)
2. [Quickstart](#quickstart)
3. [Usage](#usage)
   - [Configuration](#configuration)
   - [Modifications](#modifications)

## Description

This repository provides instructions on setting up a containerized Minecraft server using Docker Compose on a virtual machine (VM). It includes all necessary configuration files and step-by-step setup guidelines.

## Quickstart

### Prerequisites

Ensure you have the following installed on your system:

- Docker
- Docker Compose
- A VM or server environment
- `scp` (for transferring files if required)

### Steps

1. Clone this repository:
   ```sh
   git clone https://github.com/your-repo/minecraft-server.git
   cd minecraft-server
   ```
2. Create a `.gitignore` file and add `server.jar` to it:
   ```sh
   echo "server.jar" >> .gitignore
   ```
3. Download `server.jar` from the official Minecraft website and place it in the project directory.
4. Transfer `server.jar` to the VM using `scp` (if applicable):
   ```sh
   scp server.jar user@your-vm:/path/to/minecraft-server/
   ```
5. Build and run the container:
   ```sh
   docker-compose up -d --build
   ```
   - `-d`: Runs the container in detached mode (in the background).
   - `--build`: Forces a rebuild of the container image before starting.

## Usage

### Configuration

1. **Dockerfile** (defines the container setup):

   ```dockerfile
   FROM openjdk:21-jdk  # Uses OpenJDK 21 as the base image

   WORKDIR /app  # Sets the working directory inside the container

   COPY server.jar eula.txt server.properties ./  # Copies necessary files into the container

   RUN chmod +x server.jar  # Ensures the server.jar file is executable

   EXPOSE 25565  # Opens port 25565 for external connections

   CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]  # Defines the command to run the Minecraft server
   ```

2. **docker-compose.yml** (defines the service):

   ```yaml
   services:
     mc-server:
       build: . # Builds the Docker image using the Dockerfile in the current directory
       ports:
         - "8888:25565" # Maps port 8888 on the host to port 25565 inside the container
       environment:
         EULA: "TRUE" # Accepts the Minecraft End User License Agreement
       volumes:
         - mc_data:/data # Creates a named volume to persist world data
       restart: on-failure # Restarts the container if it crashes

   volumes:
     mc_data: # Defines the volume for persistent data storage
   ```

3. **eula.txt** (required to accept Minecraft's terms and conditions):

   ```txt
   eula=true
   ```

4. **server.properties** (server configuration settings):
   ```properties
   gamemode=survival
   difficulty=easy
   max-players=20
   server-port=25565
   online-mode=false
   allow-nether=true
   spawn-monsters=true
   enable-command-block=false
   ```
   Modify as needed to adjust server settings.

### Modifications

- To change server settings, edit `server.properties`.
- To update the Minecraft version, replace `server.jar` with the latest version.
- Restart the server after making changes:
  ```sh
  docker-compose down && docker-compose up -d --build
  ```
  - `docker-compose down`: Stops and removes the running container.
  - `docker-compose up -d --build`: Rebuilds and starts the container in the background.

Your Minecraft server should now be up and running!
