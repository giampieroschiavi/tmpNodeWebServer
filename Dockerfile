FROM node:20.19.4-alpine

RUN apk add --no-cache --update bash

WORKDIR /myapp

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "node", "app/index.js" ]

