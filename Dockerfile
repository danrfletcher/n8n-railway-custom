FROM n8nio/n8n:latest

USER root

# 1. Remove custom node directories (kill CustomDirectoryLoader)
RUN rm -rf /home/node/.n8n/nodes && \
    rm -rf /home/node/.n8n/custom

# 2. Enable pnpm (comes via corepack in Node 18+)
RUN corepack enable

# 3. Install nodes using pnpm (NOT npm)
RUN cd /usr/local/lib/node_modules/n8n && \
    pnpm add \
        n8n-nodes-streaming-http-request \
        @apify/n8n-nodes-apify

USER node

CMD ["n8n", "start"]
