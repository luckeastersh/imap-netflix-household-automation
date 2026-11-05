
FROM mcr.microsoft.com/playwright:v1.51.1-jammy

WORKDIR /app

# Installa Yarn
RUN corepack enable \
    && corepack prepare yarn@1.22.22 --activate

# Copia i file delle dipendenze
COPY package.json yarn.lock ./

# Installa le dipendenze
RUN yarn install --frozen-lockfile

# Copia il codice
COPY . .

# Avvia il listener IMAP
CMD ["yarn", "start"]
