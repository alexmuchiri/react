# Build step 1 for the process

FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <---- the folder that we care about 
# Build step 2

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
