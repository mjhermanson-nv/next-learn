FROM node:20-bookworm

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Set working directory
WORKDIR /app

# Copy package files
COPY dashboard/final-example/package*.json dashboard/final-example/pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application
COPY dashboard/final-example/ ./

# Expose port
EXPOSE 3001

# Set environment variable for port
ENV PORT=3001

# Start the development server
CMD ["pnpm", "dev"]


