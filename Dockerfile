FROM n8nio/n8n:latest

USER root
WORKDIR /home/node

# Install streaming HTTP node
RUN npm install --legacy-peer-deps n8n-nodes-streaming-http-request

USER node
EXPOSE 5678
CMD ["n8n", "start"]
