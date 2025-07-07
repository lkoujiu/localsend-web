FROM node:24-bookworm AS builder

WORKDIR /data

RUN git clone -b main https://github.com/localsend/web.git .

RUN corepack enable pnpm && \
    pnpm install && \
    pnpm run generate

FROM caddy:alpine
COPY --from=builder /data/.output/public /usr/share/caddy
COPY <<"EOT" /etc/caddy/Caddyfile
https:// {
    root * /usr/share/caddy
    file_server
    tls internal {
	    on_demand
    }
}
EOT
