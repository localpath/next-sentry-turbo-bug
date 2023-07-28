FROM node:18-alpine
 
WORKDIR /usr/src/app
 
# Copy root package.json and lockfile
COPY package.json ./
COPY pnpm-lock.yaml ./

COPY apps/web/package.json ./apps/web/package.json
COPY apps/docs/package.json ./apps/docs/package.json
COPY turbo.json ./turbo.json
 
RUN npm install -g pnpm turbo

RUN pnpm install
 
# Copy app source
COPY . .
 
EXPOSE 3000 3001
 
CMD ["pnpm", "dev", "--filter=web"]