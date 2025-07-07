# [LocalSend](https://github.com/localsend/web) Web App

A web app integrating WebRTC and WebSockets to share files with other LocalSend peers (browsers, or native versions).

## Tags

- `latest`: latest localsend web app on top of [caddy](https://hub.docker.com/_/caddy) image

## Pull

```bash
podman pull docker.io/queeup/localsend-web

# OR

podman pull ghcr.io/queeup-containers/localsend-web
```

## Use

```bash
podman run \
    --detach \
    --name localsend-web \
    --publish 8080:443 \
    --rm \
    --volume caddy-data:/data `# Caddy stores TLS certificates` \
    localsend-web
```

Now you can open self-hosted `localsend-web` on your browser

- `https://localhost:8080` or `https://ip_address:8080`

## Build

```bash
podman build --tag localsend-web --file Containerfile
```

[Containerfile is here](https://github.com/queeup-containers/localsend-web/blob/main/Containerfile)
