# syntax=docker/dockerfile:1

# Use the node:19.7.0-alpine base image
FROM node:19.7.0-alpine

# Set the environment variable NODE_ENV with a value of production
ENV NODE_ENV=production
ENV SQLITE_DB_LOCATION=/labone/todos

# Create a new directory in root called labone and change the ownership to the node user and node group
RUN mkdir /labone && chown node:node /labone

# Set this new folder as the working directory
WORKDIR /labone

# Set the user to node
USER node

# Copy all source files and change the file ownership to the node user and node group
COPY --chown=node:node . .

# Run the npm install command to install your node.js packages
# RUN yarn install --production
RUN npm install


# Set the default execution command to node src/index.js
CMD ["node", "src/index.js"]

# Expose port 3000
EXPOSE 3000


