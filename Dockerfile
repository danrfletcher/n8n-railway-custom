FROM n8nio/n8n:latest

USER root

# 1. Remove custom node directories (disable CustomDirectoryLoader completely)
RUN rm -rf /home/node/.n8n/nodes && \
    rm -rf /home/node/.n8n/custom

# 2. Use existing pnpm (already in image)
RUN cd /usr/local/lib/node_modules/n8n && \
    pnpm add \
        n8n-nodes-streaming-http-request \
        @apify/n8n-nodes-apify

USER node

CMD ["n8n", "start"]
