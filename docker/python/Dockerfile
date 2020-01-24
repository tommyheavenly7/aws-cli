FROM python:3-alpine

RUN apk --no-cache add \
    "bash>=5.0.11-r1" \
    "curl>=7.67.0-r0" \
    "groff>=1.22.4-r0" \
    "jq>=1.6-r0" \
    "less>=551-r0"

RUN pip install --upgrade 'pip>=20.0.1'
RUN pip install --upgrade 'awscli>=1.17.8'
RUN bash -c 'echo complete -C '/usr/local/bin/aws_completer' aws  >> $HOME/.bashrc'

COPY ./run_tests.sh /var/run_tests.sh