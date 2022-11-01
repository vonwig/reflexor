FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:5f49fb6f3207d708c822976da6e9a2f81119c92ce7737f51fec3afc6cf852721

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
