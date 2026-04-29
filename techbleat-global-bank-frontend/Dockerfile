FROM node:20

WORKDIR /app

COPY techbleat-global-bank-frontend/package*.json ./
RUN npm install

COPY techbleat-global-bank-frontend/. .

EXPOSE 3000

CMD ["npm", "run", "dev"]