FROM node:12-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install --only=production
RUN npm install -g serve
COPY ./build .

EXPOSE 80
CMD [ "serve", "-s", "build", "-l", "80" ]