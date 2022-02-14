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

## Build the latest images

### GHCR

```shell script
docker build --pull --tag ghcr.io/tommyheavenly7/aws-cli/aws:latest ./docker/python
```

```shell script
docker build --pull --tag ghcr.io/tommyheavenly7/aws-cli/aws-1x:latest ./docker/python
```

### Docker Hub

```shell script
docker build --pull --tag tommynovember7/aws-cli:latest ./docker/python
```

## Push the images

### GHCR

```shell script
docker push ghcr.io/tommyheavenly7/aws-cli/aws:latest
```

```shell script
docker push ghcr.io/tommyheavenly7/aws-cli/aws-1x:latest
```

### Docker Hub

```shell script
docker push tommynovember7/aws-cli:latest
```
