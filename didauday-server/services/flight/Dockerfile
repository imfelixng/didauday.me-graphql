FROM node:alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 5003

CMD [ "npm", "start" ]
