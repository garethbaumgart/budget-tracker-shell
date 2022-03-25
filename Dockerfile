FROM node:16 as build
WORKDIR /app
COPY package.json /app
RUN npm i
COPY . .
RUN npm run build

FROM nginx:alpine as publish
#remove default nginx website
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
