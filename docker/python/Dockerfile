FROM python:3-alpine

RUN apk --update add \
    bash \
    curl \
    groff \
    jq \
    less

RUN pip3 install awscli --upgrade
RUN bash -c 'echo complete -C '/usr/local/bin/aws_completer' aws  >> $HOME/.bashrc'

ADD ./run_tests.sh /var/run_tests.sh