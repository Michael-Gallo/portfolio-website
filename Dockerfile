FROM nginx:latest
COPY ./templates/index.html /usr/share/nginx/html
COPY ./static /usr/share/nginx/html/static