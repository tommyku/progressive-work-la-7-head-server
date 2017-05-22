FROM node:7.10.0-alpine

ENV PROJECT_DIR=/usr/src/app/

WORKDIR $PROJECT_DIR

COPY package.json $PROJECT_DIR

RUN apk add --no-cache git && \
    npm install --production --no-optional && \
    apk del git && \
    rm -rf /tmp/* /root/.npm

EXPOSE 8082

COPY entrypoint $PROJECT_DIR

ENTRYPOINT [ "./entrypoint" ]

CMD [ "start" ]
