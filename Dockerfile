FROM node:14-slim

# Definir o diretório de trabalho
WORKDIR /app

ARG API_PORT
ARG MONGO_URL
ARG CLIENT_ID

ENV API_PORT=${API_PORT}
ENV MONGO_URL=${MONGO_URL}
ENV CLIENT_ID=${CLIENT_ID}

# Atualizar pacotes e instalar dependências
RUN apt update && \
    apt install -y \
    git nodejs npm psmisc \
    ca-certificates fonts-liberation libappindicator3-1 libatk-bridge2.0-0 libcups2 \
    libdrm-dev libgbm-dev libgtk-3-0 libnspr4 libnss3 libxss1 \
    lsb-release xdg-utils libasound2 libdrm2 libxcomposite1 libxrandr2 \
    libgbm1

COPY package*.json .

RUN npm i --silent

COPY . .

EXPOSE ${API_PORT}

# Definir o comando para rodar o aplicativo
CMD npm start