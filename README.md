# hello-world
We need to link the world.

## Important

- You need to buy an abroad VPS.
- Singin a domain
- Modify Your DNS AAAA record to point the VPS's IP address.
- Checking your fire wall. allow 80 and 443 ports.

## Getting start

Step.1 We need to install docker engine.

```sh
curl -fsSL https://get.docker.com | sh -
```

Step.2 Install Docker-ce

```sh
curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose


curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
```

```sh
wget https://hello-world.marchocode.life -O docker-compose.yaml
```

Step.3 Downloading and Running

```sh
docker-compose run -d -e HOST=xxx.example.com
```


## Reference
- https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script
- https://github.com/acmesh-official/acme.sh