FROM node:16


# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm i

# Copy the rest of the application code to the container
COPY . .
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm","run", "start"]
