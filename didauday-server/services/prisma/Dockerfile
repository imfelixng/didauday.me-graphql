FROM node:alpine

WORKDIR /app

# install prisma cli
RUN npm install -g prisma

COPY . .

# allow execution for entrypoint scripts
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]