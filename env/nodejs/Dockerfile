FROM alpine:3.7

# Build arguments
ARG UID=1000
ARG GID=1000

# Install the basic useful packages
RUN apk --update add bash wget dpkg-dev

# Add the www user
RUN addgroup -g $GID www && \
    adduser -D -u $UID -G www -s /bin/bash www

# Download Node.Js and NPM
RUN apk add --update --no-cache nodejs nodejs-npm  

# Create app directory
# WORKDIR /var/www/src

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package*.json ./

# RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
# COPY ./../../src /var/www/

EXPOSE 80 443 3000
# CMD [ "npm", "start" ]
