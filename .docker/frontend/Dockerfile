ARG NODE_VERSION=""
FROM node:${NODE_VERSION:+${NODE_VERSION}-}alpine

WORKDIR /var/www/html

EXPOSE 8080

COPY . .

RUN ls -la

# RUN npm install
CMD npm install && npm run start