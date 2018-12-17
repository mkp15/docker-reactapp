FROM node:alpine as builder

WORKDIR '/app'

# Install some pdendencies

COPY package.json .

# Install some pdendencies

RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html