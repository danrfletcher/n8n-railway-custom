FROM n8nio/n8n:latest

USER root

# 1. Remove any custom nodes directory to kill CustomDirectoryLoader usage
RUN rm -rf /home/node/.n8n/nodes && \
    rm -rf /home/node/.n8n/custom

# 2. Install nodes directly into n8n core (the reliable method)
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install --save --legacy-peer-deps \
        n8n-nodes-streaming-http-request \
        @apify/n8n-nodes-apify

USER node

CMD ["n8n", "start"]
