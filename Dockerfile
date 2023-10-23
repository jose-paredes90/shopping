# Node server
FROM node:20.6.1-alpine as node
WORKDIR /app
COPY ./ /app
RUN npm install
RUN npm run build:production

FROM nginx:1.25.0-alpine
COPY --from=node /app/dist/shopping /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf