FROM pinkrobin/docker-ansible-alpine:2.8.5-3.10.3-py2.7

MAINTAINER Chris Sim <chris.sim@dailyvanity.sg>

RUN apk add nodejs npm
RUN npm i @actions/core -g

COPY entrypoint.sh /entrypoint.sh
COPY setSecret.js /setSecret.js
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]