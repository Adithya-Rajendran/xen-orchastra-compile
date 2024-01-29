FROM debian:latest

# Install dependencies
RUN apt-get update && apt-get install -y build-essential redis-server libpng-dev git python3-minimal libvhdi-utils lvm2 cifs-utils nfs-common ntfs-3g

# Install node.js and yarn
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash - &&\
    apt-get install -y nodejs &&\
    npm install --global yarn

# Set working directory
WORKDIR /app

# Clone Xen Orchestra repository
RUN git clone -b master --depth 1 https://github.com/vatesfr/xen-orchestra

# Change working directory to Xen Orchestra
WORKDIR /app/xen-orchestra

# Install dependencies and build Xen Orchestra
RUN yarn install && \
    yarn build

# Configure XO server
RUN cd packages/xo-server && \
    mkdir -p ~/.config/xo-server && \
    cp sample.config.toml ~/.config/xo-server/config.toml

EXPOSE 80

# Start XO server
CMD ["yarn", "start"]
