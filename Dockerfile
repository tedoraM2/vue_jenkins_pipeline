# Multi-purpose image: can run both dev and prod builds
FROM node:22-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build the application for production
RUN npm run build

# Expose ports for both dev server and production
EXPOSE 5173 3000

# Default to dev server; override with `npm start` or similar for production
CMD ["npm", "run", "dev"]
