FROM alpine/ansible:2.17.0

MAINTAINER Chris Sim <chris.sim@dailyvanity.sg>

RUN apk add nodejs npm
RUN npm i @actions/core -g
RUN mkdir -p /nodeapp

COPY entrypoint.sh /entrypoint.sh
COPY setSecret.js /nodeapp/setSecret.js
RUN chmod +x /entrypoint.sh
RUN cd /nodeapp && npm i @actions/core

ENTRYPOINT [ "/entrypoint.sh" ]
