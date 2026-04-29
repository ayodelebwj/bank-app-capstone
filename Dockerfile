FROM node:20 AS builder

WORKDIR /app

COPY techbleat-global-bank-frontend/ .

RUN rm -rf node_modules package-lock.json || true

RUN npm install --legacy-peer-deps

RUN npm run build


FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]