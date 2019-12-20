# aws-cli

Containerised AWS CLI using [Python official image](https://hub.docker.com/_/python).

This project will provide both the Dockerfile to create `aws-cli` container and an example how to use it with `docker-compose`.

## Basic Usage

### Prepare container using `docker-compose`

You might want to clone the project before starting.

```shellscript
git clone git@github.com:tommyheavenly7/aws-cli.git
cd aws-cli
```

First, please think whether you want to replace the `project` directory with your working project. `docker-compose` will mount the project directory as `/var/project`, and it will be the working_dir.

``` shellscript
$ ls
README.md  docker   docker-compose.yaml project
```

Next, configure environment variables. They are defined in `docker/.bashrc`. You can edit it as you like.

```shellscript
cp docker/.bashrc.dist docker/.bashrc

## Edit the .bashrc
```

Load the environment variables you defined.

```shellscript
source docker/.bashrc
```

After that, build and up the container

```shellscript
docker-compose build --pull
docker-compose up --no-start
```

Please confirm whether the container is ready.

```shellscript
$ docker-compose ps
     Name              Command         State    Ports
-----------------------------------------------------
aws-cli_command   /usr/local/bin/aws   Exit 0
```

Finally, you can use the command `_run` bundled with the project.

```shellscript
$ _run aws --version
aws-cli/1.16.307 Python/3.8.0 Linux/4.9.184-linuxkit botocore/1.13.43
```

## Appendix

### References

- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)
- [User Guide: Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)