# Use an official Node runtime as a parent image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Install dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# If you're using npm 7 or above, the --legacy-peer-deps
# option can help solve peer dependency issues when installing.
RUN npm install --silent --legacy-peer-deps

# Bundle app source inside the Docker image
COPY . .

# Build your Next.js application
RUN npm run build

# Your app binds to port 3000, so you'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 3000

# Define the command to run your app using CMD which defines your runtime
CMD ["npm", "start"]
