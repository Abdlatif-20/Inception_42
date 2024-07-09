# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# install the required packages
RUN apt-get install -y redis

# copy the script to the container
COPY /tools/script.sh /

# change the permissions of the script
RUN chmod +x script.sh

# run the script
CMD [ "./script.sh" ]