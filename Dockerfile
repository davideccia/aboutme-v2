FROM --platform=linux/amd64 node:23-alpine AS build
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn run build

FROM --platform=linux/amd64 httpd:2.4 AS runtime
COPY --from=build /app/dist /usr/local/apache2/htdocs/
EXPOSE 80