FROM node as build
WORKDIR /app
COPY package.json .
RUN npm install
ENV REACT_APP_NAME=myName
COPY . .
RUN npm run build

FROM nginx
COPY --from=build /app/build /usr/share/nginx/html