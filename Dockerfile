FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# The build folder will be created in the container

# to setup second part we use another FROM
# FROM statements begin the next block
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# NGINX should start automatically by default.
