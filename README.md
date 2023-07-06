# post-quantum-support-openssl-docker
Implementation of https://github.com/open-quantum-safe/openssl in docker container for convenience. No more complicated installation and break your local OpenSSL.

## Using Docker Compose
1. Build docker compose using `docker-compose build`
2. Run docker compose using `docker-compose up`
3. Enter the docker shell
4. Run `OpenSSL` command on the container shell. In example, 

```
openssl req -x509 -new -newkey dilithium3 -keyout /shared/dilithium3_CA.key -out /shared/dilithium3_CA.crt -nodes -subj "/CN=oqstest CA" -days 365
```

Make sure to point out the output file to `/shared/` directory, since it was mounted as shared volume in docker.