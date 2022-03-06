# DWBE - Toolbox 55 - Docker
Docker es un proyecto de código abierto que automatiza el despliegue de aplicaciones dentro de contenedores de software, proporcionando una capa adicional de abstracción y automatización de virtualización de aplicaciones en múltiples sistemas operativos.


## Recomendaciones preliminares
Registrarse en https://hub.docker.com/


## Instalación de Docker

Link para instalación de Docker engine: https://docs.docker.com/engine/install/

## Ejecutar Hello World

    docker run hello-world

  > Nota: En caso de no contar con la imagen hello-world la misma sera descarga.
  > La salida de la ejecución anterior será similar a la siguiente:

    Hello from Docker!
    This message shows that your installation appears to be working correctly.
    
    To generate this message, Docker took the following steps:
     1. The Docker client contacted the Docker daemon.
     2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
        (amd64)
     3. The Docker daemon created a new container from that image which runs the
        executable that produces the output you are currently reading.
     4. The Docker daemon streamed that output to the Docker client, which sent it
        to your terminal.
    
    To try something more ambitious, you can run an Ubuntu container with:
     $ docker run -it ubuntu bash
    
    Share images, automate workflows, and more with a free Docker ID:
     https://hub.docker.com/
    
    For more examples and ideas, visit:
     https://docs.docker.com/get-started/ 
    

## Operaciones sobre docker

### 1. Descarga (pull)
Descarga de la imagen de redis desde Docker Hub:

    docker pull redis

La salida es la siguiente:

    Using default tag: latest
    latest: Pulling from library/redis
    a2abf6c4d29d: Already exists 
    c7a4e4382001: Pull complete 
    4044b9ba67c9: Pull complete 
    c8388a79482f: Pull complete 
    413c8bb60be2: Pull complete 
    1abfd3011519: Pull complete 
    Digest: sha256:db485f2e245b5b3329fdc7eff4eb00f913e09d8feb9ca720788059fdc2ed8339
    Status: Downloaded newer image for redis:latest
    docker.io/library/redis:latest


### 2. Creación de contenedor (container) (run)
A través del comando run y algunos parámetros generamos el contenedor asociado, y lo arranca automáticamente:

    docker run --name redis-container -p 6380:6379 -d redis

### 3. Otras operaciones sobre el contenedor creando anteriormente:

    # arranque
    docker start redis-container

    # detención
    docker stop redis-container

    # detención y posterior arranque
    docker restart redis-container

    # eliminación del contenedor
    docker rm redis-container

    # eliminación de la imagen
    docker rmi redis-container


### 4. Otros comandos:

    Acceso interno al contenedor:
    docker exec -it redis-container bash

    Vista de los procesos en ejecución:
    docker ps

    Lista de imagenes
    docker images list

    Tamaño en disco:
    docker system df
    sudo du -sh /var/lib/docker/

### 5. Integración con VSCode y VSCodium

    Se puede utilizar la siguiente extensión:
    ms-azuretools.vscode-docker
    https://code.visualstudio.com/docs/containers/overview


## Creación de docker image con nodejs
https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

### 1. Dockerizing a Node.js web app
### 2. Create the Node.js app
### 3. Creating a Dockerfile
```
FROM node:16

# Create app directory inside image
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# apt-get install nano (optional)
RUN apt-get update && apt-get install -y curl && apt-get install nano

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
RUN npm install -g npm@8.3.1

# Fix vulnerabilities on npm
RUN npm audit fix

# Bundle app source
COPY . .

# Expose port access app
EXPOSE 8080

CMD [ "node", "server.js" ]
```
### 4. .dockerignore file

node_modules
npm-debug.log

### 5. Building your image with tag desired

    docker build . -t fmq/node-web-app

    docker images

### 6. Run the image (create the container)

    docker run --name node-fmq -p 4000:8080 -d fmq/node-web-app

Print the output of your app:

    # Get container ID
    $ docker ps

    # Print app output
    $ docker logs <container id>

    # Example
    Running on http://localhost:8080


    # Enter the container
    $ docker exec -it <container id> /bin/bash

### 7. Test

    docker ps

    curl -i localhost:4000


### 8. Delete container

    docker stop <container id>

    docker rm <container id>

### 8. Delete image

    docker rmi fmq/node-web-app



<div class="footer">
    &copy; 2022 Felipe Morales
</div>