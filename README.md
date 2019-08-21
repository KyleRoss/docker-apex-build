# docker-apex-build
Basic docker container to use for building Node/Go applications within a CI environment that are deployed using [Apex](https://apex.run).

### Included
- Amazon Linux (latest)
- NVM - Node 10.16.3 (for latest Lambda support `nodejs10.x`)
- Go 1.10.1
- Apex (latest)

### Using Different Version of Node
If you need to use a different version of Node in your Dockerfile, you can utilize [NVM](https://nvm.sh) to download and switch your Node version or set the environment variable `NODE_VERSION`.

```dockerfile
FROM kylerross/apex-build

RUN nvm install 12

# ...
```
