# aws-cli

Containerised AWS CLI using [Python official image](https://hub.docker.com/_/python).

This project will provide both the Dockerfile to create `aws-cli` container and an example how to use it with `docker-compose`.

## Basic Usage

### Setting environment variables 

Before running the container, you should set required environment variables:

```bash
$ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
$ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$ export AWS_DEFAULT_REGION=us-west-2
```

### Running the container with docker command

You can run the following command as AWS CLI:

```bash
docker run --rm -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v "$(pwd):/project" --entrypoint /usr/local/bin/aws tommynovember7/aws-cli:latest
``` 

```bash
$ docker run --rm -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v "$(pwd):/project" --entrypoint /usr/local/bin/aws tommynovember7/aws-cli:latest
 --version
aws-cli/1.17.8 Python/3.8.1 Linux/4.19.76-linuxkit botocore/1.14.8
```

### Running the container using `docker-compose`

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
docker-compose build --force-rm --pull
docker-compose up --no-start --force-recreate --remove-orphans
```

Please confirm whether the container is ready.

```shellscript
$ docker-compose ps
     Name              Command         State    Ports
-----------------------------------------------------
aws-cli_command   /usr/local/bin/aws   Exit 0
```

Finally, you can use the command.

```shellscript
$ command -v aws
alias aws='docker-compose run --rm aws'

$ aws --version
aws-cli/1.17.8 Python/3.8.1 Linux/4.19.76-linuxkit botocore/1.14.8
```

## Appendix

### References

- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)
- [User Guide: Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)