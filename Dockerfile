FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:ad0bc3641fc92a92002ae1d08008f256ba3d71f5056bfc7cd448a02a98419af6

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
