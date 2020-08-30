FROM node:alpine as build

WORKDIR '/app'

COPY package.json .

RUN npm i

COPY . .

RUN npm run build

FROM nginx as deployment
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html