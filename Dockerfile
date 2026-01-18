FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

# Install PM2 globally
RUN npm install -g pm2

COPY . .

EXPOSE 3000

# Use pm2-runtime (Docker-friendly)
CMD ["pm2-runtime", "ecosystem.config.js"]
