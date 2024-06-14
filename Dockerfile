FROM node:alpine

WORKDIR /app

# TODO: No packages yet
# COPY package.json .
# RUN npm install

COPY ./app .

EXPOSE 3000

# TODO: Maybe alpine?
# RUN useradd app
# USER app

CMD ["node", "app.js"]
