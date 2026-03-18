FROM n8nio/n8n:latest

USER root

RUN mkdir -p /home/node/.n8n/nodes && \
    cd /home/node/.n8n/nodes && \
    npm init -y && \
    npm install --legacy-peer-deps \
        n8n-nodes-streaming-http-request \
        @apify/n8n-nodes-apify && \
    chown -R node:node /home/node/.n8n

USER node

CMD ["n8n", "start"]
