# Build block
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# The build folder will be created in the container
# The node:alpine above is only needed for building due to dependencies.
# Below we will get nginx and shift the app into that.

# to setup second part we use another FROM
# FROM statements begin the next block

# production Block
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# NGINX should start automatically by default.
