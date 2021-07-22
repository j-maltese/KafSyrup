#current node version is 14.16.1
FROM node:14
# Create app directory
WORKDIR /usr/src/app
#if we want the whole app we could do < COPY . . >
COPY ./react-app /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
# If you are building your code for production
# RUN npm ci --only=production
RUN  npm install
#RUN npm run dev *do we need this?
# Bundle app source
COPY . .
#expose port that app binds to
EXPOSE 3000
#start the server, *we might need to add a start script to our package json for this.
ENTRYPOINT [ "npm", "start" ]
#could try ["npm", "run dev"]
#could try CMD [ "node", "server.js" ]
