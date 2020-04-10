# aws-cli

[amazon](https://hub.docker.com/u/amazon) finally released the **AWS CLI v2** as a docker image. We can use it the exact same way as I'm trying to provide. Why not consider to use the official one first if you're looking for the latest version.

[amazon/aws-cli](https://hub.docker.com/r/amazon/aws-cli)



----

This is a containerised **AWS CLI v1** using [Python official image](https://hub.docker.com/_/python).

## Basic Usage

### Using existing credentials

If you already have IAM credentials in `~/.aws`, of course, you can use it:

```bash
docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws tommynovember7/aws-cli:latest
```

You would be better to add the command into `~/.bashrc` as an alias:

```bash
# ~/.bashrc

alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws tommynovember7/aws-cli:latest'
```

```bash
$ command -v aws
alias aws='docker run --rm -ti -v ~/.aws:/root/.aws -v $(pwd):/project tommynovember7/aws-cli:latest'
$ aws --version
aws-cli/1.18.39 Python/3.8.2 Linux/4.19.76-linuxkit botocore/1.15.39

```

### Using environment variables 

Before running the container, you should set required environment variables:

```bash
$ export AWS_ACCESS_KEY_ID=******
$ export AWS_SECRET_ACCESS_KEY=******
$ export AWS_DEFAULT_REGION=******
```

You can run the following command as AWS CLI:

```bash
docker run --rm -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v "$(pwd):/aws" tommynovember7/aws-cli:latest
``` 

```bash
$ docker run --rm -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v "$(pwd):/aws" tommynovember7/aws-cli:latest
 --version
aws-cli/1.18.39 Python/3.8.2 Linux/4.19.76-linuxkit botocore/1.15.39
```

### Running the container using `docker-compose.`

You might want to clone the project before starting.

```bash
git clone git@github.com:tommyheavenly7/aws-cli.git
cd aws-cli
```

First, please think whether you want to replace the `project` directory with your working project. `docker-compose` will mount the project directory as `/var/project`, and it will be the working_dir.

```bash
$ ls
README.md  docker docker-compose.yaml project
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

After that, build and up the container.

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
aws-cli/1.18.39 Python/3.8.2 Linux/4.19.76-linuxkit botocore/1.15.39
```

## Appendix

### References

- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)
- [User Guide: Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
