# 1. Use official Node.js image
FROM node:18-alpine

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy package files first (for caching)
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy the rest of the application
COPY . .

# 6. Expose the app port
EXPOSE 3000

# 7. Start the app
CMD ["npm", "start"]
