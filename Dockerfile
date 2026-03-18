FROM n8nio/n8n:latest

USER root

# Create the directory n8n expects for custom extensions
RUN mkdir -p /home/node/.n8n/custom/node_modules

# Install the nodes into that specific subdirectory
WORKDIR /home/node/.n8n/custom/node_modules
RUN npm init -y && \
    npm install --legacy-peer-deps \
        n8n-nodes-streaming-http-request \
        @apify/n8n-nodes-apify

# Ensure the 'node' user owns the files so n8n can read them
RUN chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node
