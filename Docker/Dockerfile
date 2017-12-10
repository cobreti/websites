FROM node:8.2

COPY NodeServers /var/www/websites/NodeServers
COPY sites /var/www/websites/sites

WORKDIR /var/www/websites/NodeServers/PorteFolio
ENTRYPOINT ["node", "server.js"]
