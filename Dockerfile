FROM node:16

# Create app directory inside image
WORKDIR /usr/src/app2

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