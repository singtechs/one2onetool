FROM dulcet/ubuntu-docker-node:latest
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
EXPOSE 3000
ENV DATA_FILE Questions.json
USER jenkins
CMD node index.js
