# Treafik for crash & compile projects

Since all our projects use docker compose as a way to develop and release our projects a natural reverse proxy to use is [traefik](https://doc.traefik.io/traefik/).

This repo allows you to

# Setting up traefik locally

## Clone the repo

```sh
git clone git@github.com:scriptcie/traefik.git
```

** Creating a docker network

```sh
docker network create traefik-proxy
```

## Adding SSL certificates

Inspired by:
https://github.com/Heziode/traefik-v2-https-ssl-localhost/blob/master/README.md

Run [`mkcert`](https://github.com/FiloSottile/mkcert) for your local certificates,
```sh
mkcert -cert-file data/certs/local-cert.pem -key-file data/certs/local-key.pem "localhost" "*.localhost" "docker.localhost" "*.docker.localhost" "domain.local" "*.domain.local" "traefik.localhost" "*.scriptcie.nl.localhost"
```

```sh
traefik  master ✗ mkcert -cert-file certs/local-cert.pem -key-file certs/local-key.pem "localhost" "*.localhost" "docker.localhost" "*.docker.localhost" "domain.local" "*.domain.local"

Created a new certificate valid for the following names 📜
 - "localhost"
 - "*.localhost"
   Warning: many browsers don't support second-level wildcards like "*.localhost" ⚠️
 - "docker.localhost"
 - "*.docker.localhost"
 - "domain.local"
 - "*.domain.local"

Reminder: X.509 wildcards only go one level deep, so this won't match a.b.localhost ℹ️

The certificate is at "certs/local-cert.pem" and the key at "certs/local-key.pem" ✅

It will expire on 2 June 2026 🗓
```

## Start traefik

```sh
docker compose up -d traefik
```

## Accessing the traefik dashboard

Go to https://traefik.scriptcie.nl.localhost and sign in with:
```
Username: scriptcie
Password: hoi
```

change these credentials by chaning the `traefik.http.middlewares.auth.basicauth.users`  key in [`docker-compose.yml`](./docker-compose.yml)
```sh
echo $(htpasswd -nb user password) | sed -e s/\\$/\\$\\$/g
```

** Check logs

```sh
docker compose logs traefik -t -f --tail=100
```

