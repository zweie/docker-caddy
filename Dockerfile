FROM caddy:builder AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/RussellLuo/caddy-ext/ratelimit \
  --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:alpine

RUN apk add --no-cache \
  fail2ban

COPY --from=builder /usr/bin/caddy /usr/bin/caddy