FROM ubuntu:latest
RUN apt-get update && apt-get install -y  nodejs && apt-get  -y install npm
COPY main.js /tmp/main.js
CMD node /tmp/main.js
EXPOSE 8081