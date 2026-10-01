FROM node:20.4-bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY . .
RUN npm i -g pnpm@8
RUN pnpm i
RUN pnpm rebuild
RUN cd node_modules/.pnpm/github.com+titaniumnetwork-dev+ultraviolet*/node_modules/@titaniumnetwork-dev/ultraviolet && npm run build
RUN npm run build
EXPOSE 8080
CMD ["npm", "start"]

