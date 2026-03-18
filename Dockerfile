FROM n8nio/n8n:latest

USER root

# Create the custom directory (NOT the node_modules dir directly)
RUN mkdir -p /home/node/.n8n/custom

# Set workdir to custom
WORKDIR /home/node/.n8n/custom

# Init package.json (name will be "custom", which is valid) and install.
# npm install will automatically create the node_modules folder inside this directory.
RUN npm init -y && \
    npm install --legacy-peer-deps \
        n8n-nodes-streaming-http-request \
        @apify/n8n-nodes-apify

# Fix permissions so the n8n user can read the files
RUN chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node

CMD ["n8n", "start"]
