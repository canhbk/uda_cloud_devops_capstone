FROM node:16-slim 


WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --network-timeout 500000 && yarn cache clean --all

COPY app.js .

EXPOSE 3000

CMD ["node", "app.js"]
