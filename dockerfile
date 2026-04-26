# Stage 1: Build
FROM node:18 AS builder

WORKDIR /app
COPY app/package*.json ./
RUN npm install

COPY app/ .
RUN npm install --production


# Stage 2: Production
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

CMD ["node", "index.js"]
