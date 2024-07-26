# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# install the required packages
RUN apt-get install -y nginx

# copy the nginx configuration 
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/www

COPY tools/* /var/www

CMD ["nginx", "-g", "daemon off;" , "-c", "/etc/nginx/nginx.conf"]
