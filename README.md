# hello-world
We need to link the world.

## Important

- You need to buy an abroad VPS.
- A domain
- Modify Your DNS AAAA record to point the VPS's IP address.
- Checking your fire wall. allow 80 and 443 ports.

## Getting start

Step.1 We need to install docker engine.

```sh
curl -fsSL https://get.docker.com | sh -
```

Step.2 Install Docker-ce

```sh
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose
```

Step.3 Downloading Configuation

```sh
wget https://hello-world.marchocode.life -O docker-compose.yaml

cat > .env <<EOF
HOST=xx.example.com
PASSWORD=password
EMAIL=youremail@gmail.com
EOF

```

Step.4 Running

```sh
docker-compose run -d
```

### Configuating Client

Maybe you can choose your favorite client.

- [v2rayN](https://github.com/2dust/v2rayN)
- [Clash for Windows](https://github.com/Fndroid/clash_for_windows_pkg)

```text

Host: Your domain address.
Password: Your customer password.
Port: 443

TLS: Yes
Transport: TCP

```


## Reference
- https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script
- https://github.com/acmesh-official/acme.sh