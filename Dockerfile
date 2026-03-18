FROM n8nio/n8n:latest

# Install custom nodes BEFORE switching users
USER root

# Create n8n custom extensions directory
RUN mkdir -p /home/node/.n8n/custom \
    && chown -R node:node /home/node/.n8n

WORKDIR /tmp

# Install streaming HTTP + Apify (your existing node)
RUN npm init -y \
    && npm install --legacy-peer-deps \
        n8n-nodes-streaming-http-request \
        @apify/n8n-nodes-apify \
    && cp -r node_modules/* /home/node/.n8n/custom/ \
    && chown -R node:node /home/node/.n8n/custom

# Fix Railway proxy issue (from your logs)
ENV N8N_EXPOSE_PUBLIC_EXPRESS_RATE_LIMIT=true

USER node
EXPOSE 5678
CMD ["n8n", "start"]
