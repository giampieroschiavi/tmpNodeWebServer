FROM node:20.19.4-alpine

RUN apk add --no-cache --update bash

WORKDIR /myapp

COPY myapp/package*.json ./

RUN npm install

COPY myapp/ .

EXPOSE 3000

# Create a non-root user with specific UID/GID for security
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup -s /bin/sh

# Change ownership of application files to the non-root user
RUN chown -R appuser:appgroup /myapp

# Switch to non-root user
USER appuser

CMD [ "node", "index.js" ]

