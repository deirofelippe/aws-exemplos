FROM node:20.10.0-alpine3.19

WORKDIR /app

COPY ./package.json ./package-lock.json ./

RUN npm ci

COPY ./ ./

USER node

CMD [ "sleep", "inf" ]