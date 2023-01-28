FROM caddy:builder AS builder

RUN xcaddy build \
    --github.com/caddy-dns/cloudflare \
    --github.com/RussellLuo/caddy-ext/ratelimit \
    --github.com/porech/caddy-maxmind-geolocation

FROM caddy:alpine

RUN apk add --no-cache \
    fail2ban

COPY --from=builder /usr/bin/caddy /usr/bin/caddy