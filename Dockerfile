FROM n8nio/n8n:latest

USER root

# 1. Remove custom node directories (disable CustomDirectoryLoader)
RUN rm -rf /home/node/.n8n/nodes && \
    rm -rf /home/node/.n8n/custom

# 2. Install pnpm globally (bypass corepack issues)
RUN npm install -g pnpm

# 3. Install community nodes into n8n core
RUN cd /usr/local/lib/node_modules/n8n && \
    pnpm add \
        n8n-nodes-streaming-http-request \
        @apify/n8n-nodes-apify

USER node

CMD ["n8n", "start"]
