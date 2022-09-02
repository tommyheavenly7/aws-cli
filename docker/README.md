# How to login github docker repo

## Log in the package repo

Before pushing the latest build, you need to log in `ghcr.io`.
In case if you don't have the personal access token, you must generate
it to log in the repo.

```shell script
echo $PACKAGE_TOKEN | docker login ghcr.io -u $USER_NAME --password-stdin
```

```shell script
echo $DOCKER_TOKEN | docker login -u $DOCKER_USER_NAME --password-stdin
```

## Build the latest images and push them

Firstly, you might want to enable `buildx` to build for multiple platforms at a time:

```shell script
docker buildx create --use
```

### GHCR

```shell script
docker buildx build --platform linux/amd64,linux/arm64 --pull --no-cache --push --tag ghcr.io/tommyheavenly7/aws-cli/aws:latest ./docker/python
```

```shell script
docker buildx build --platform linux/amd64,linux/arm64 --pull --push --tag ghcr.io/tommyheavenly7/aws-cli/aws-1x:latest ./docker/python
```

### Docker Hub

```shell script
docker buildx build --platform linux/amd64,linux/arm64 --pull --no-cache --push --tag tommynovember7/aws-cli:latest ./docker/python
```
