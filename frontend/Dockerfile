FROM node:alpine as builder
#the "builder" is just a name to refer to this phase or block
WORKDIR '/app'
COPY package.json .
RUN npm install
RUN npm audit fix
#copying all source code into container
COPY . .
RUN npm run build
# The build folder will be created into /app/build in the container

# to setup second part we use another FROM
# FROM statements begin the next block. any prior blocks are terminited
# This block will copy our app with out the dependencies from build above
FROM nginx
# COPY --from=<phase or block name> <item to be copied> <place to copy to in container>
COPY --from=builder /app/build /usr/share/nginx/html
# NGINX should start automatically by default.
