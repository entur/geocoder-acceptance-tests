FROM node:12.14.1-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .

RUN yarn

ENTRYPOINT ["./entrypoint.sh"]
