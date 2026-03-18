FROM n8nio/n8n:latest

USER root

# Install custom nodes in a SEPARATE directory, not inside .n8n
RUN mkdir -p /home/node/custom-nodes && \
    cd /home/node/custom-nodes && \
    npm init -y && \
    npm install --legacy-peer-deps \
        n8n-nodes-streaming-http-request \
        @apify/n8n-nodes-apify && \
    chown -R node:node /home/node/custom-nodes

USER node

CMD ["n8n", "start"]
