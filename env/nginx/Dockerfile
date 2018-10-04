FROM nginx:1.15-alpine

# Build arguments
ARG UID=1000
ARG GID=1000

# Install the basic useful packages
RUN apk --update add bash wget dpkg-dev

# Add the www user
RUN addgroup -g $GID www && \
    adduser -D -u $UID -G www -s /bin/bash www

EXPOSE 8088