FROM node:20-alpine

WORKDIR /app

COPY techbleat-global-bank-frontend/package*.json ./
RUN npm install vite@^7

COPY techbleat-global-bank-frontend/. .

EXPOSE 5173

CMD ["npm", "run", "dev"]