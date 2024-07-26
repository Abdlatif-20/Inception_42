FROM debian:bullseye

# update && upgrade packages
RUN apt-get update && apt-get upgrade -y

# install Nginx
RUN apt-get install -y nginx

#copy nginx config file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# install nano
RUN apt-get install nano -y

# folder to store certificate ssl
RUN mkdir -p /etc/nginx/ssl

# install tool for SSL certificate
RUN apt install openssl -y

# create a certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=US/ST=IDF/L=Paris/O=42/OU=42/CN=aben-nei.42.fr/UID=aben-nei"

# folder to store a nginx config file
RUN mkdir -p /var/run/nginx

# create wordpress folder
RUN mkdir -p /var/www/wordpress

CMD ["nginx", "-g", "daemon off;"]
