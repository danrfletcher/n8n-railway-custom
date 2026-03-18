USER root
RUN npm config set legacy-peer-deps true \
    && npm install -g n8n-nodes-streaming-http-request @apify/n8n-nodes-apify
USER node
CMD ["n8n", "start"]
