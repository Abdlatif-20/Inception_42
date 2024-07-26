FROM debian:bullseye

# Update and install necessary packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y curl tar

# Download and extract Portainer
RUN curl -L https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz -o portainer-2.19.4-linux-amd64.tar.gz \
    && tar xzvf portainer-2.19.4-linux-amd64.tar.gz \
    && rm portainer-2.19.4-linux-amd64.tar.gz

CMD ["portainer/portainer", "--bind-https", "0.0.0.0:6443"]