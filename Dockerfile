FROM ubuntu:latest
LABEL org.opencontainers.image.author="Kuzioła" \
      org.opencontainers.image.email="s97656@pollub.edu.pl"
RUN apt-get update && apt-get install -y \
    apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY index.html /var/www/html/index.html
COPY apache_ports_config_8080.txt /etc/apache2/ports.conf
COPY apache_000-default_config_8080.txt /etc/apache2/sites-available/000-default.conf
EXPOSE 8080
CMD [ "apachectl", "-D", "FOREGROUND" ]