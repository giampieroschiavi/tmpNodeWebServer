FROM node:20.19.4-alpine

RUN apk add --no-cache --update bash

WORKDIR /myapp

COPY myapp/package*.json ./

RUN npm install

COPY myapp/ .

EXPOSE 3000

CMD [ "node", "index.js" ]

