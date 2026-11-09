FROM node:24-alpine@sha256:a34ab6d7f6f4813f4d0c5469d74685604b962fbdbf5793a7bc7b4998ecb867c8
# Pick up Alpine security fixes released after the base image was built (Trivy CRITICAL otherwise).
RUN apk upgrade --no-cache
WORKDIR /app
ENV NODE_ENV=production PORT=8080
COPY package.json package-lock.json ./
RUN npm ci --omit=dev && npm cache clean --force
# Node 24 runs the TypeScript sources directly (type stripping): no build step.
COPY src ./src
USER node
EXPOSE 8080
CMD ["node", "src/server.ts"]
