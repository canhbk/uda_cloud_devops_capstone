FROM node:16-slim 

RUN apt-get update -y\
  && apt-get install curl -y \
  && apt-get upgrade -y \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --network-timeout 500000
RUN yarn cache clean --all

COPY app.js .


EXPOSE 3000

HEALTHCHECK --interval=5s --timeout=3s --start-period=10s \
  CMD curl -f http://localhost:3000 || exit 1

CMD node app.js
