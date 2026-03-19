FROM n8nio/n8n:latest

USER root

# Standard location where n8n automatically looks for community nodes
RUN mkdir -p /home/node/.n8n/nodes

# Install the packages there (exactly like the UI does)
WORKDIR /home/node/.n8n/nodes
RUN npm init -y && \
    npm install --legacy-peer-deps \
        n8n-nodes-streaming-http-request \
        @apify/n8n-nodes-apify

# Fix permissions
RUN chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node

CMD ["n8n", "start"]
