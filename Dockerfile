# This Dockerfile is inspired by https://terra10.nl/blog/how-to-run-ghost-cloud-native-aws/ for the routing part and the storage-adadapter part


# Alpine version (light version) of ghost is used to build the image
FROM ghost:3.15-alpine

# This part will be useful when we'll create a template for some pages
#COPY ./ghost_theme/Casper /var/lib/ghost/content/themes/Casper

# The routes.yaml file is used to define some custom content and translations
COPY ./routes.yaml /var/lib/ghost/content/settings/routes.yaml

# This storage adapter enabled a s3 storage (first, it's installed on the system with NPM, then it's linked to be used by Ghost) 
RUN npm install -g ghost-storage-adapter-s3@2.8.0 && \
    ln -s /usr/local/lib/node_modules/ghost-storage-adapter-s3 ./current/core/server/adapters/storage/s3

# Like this project is to be a simple backoffice for Gatsby, it's useless to install a mysql client so, nothing more to do for now!
