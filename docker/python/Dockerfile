FROM python:3-alpine

ENV PYTHONUNBUFFERED=1
RUN apk --no-cache add \
    "bash>=5.0.17-r0" \
    "curl>=7.77.0-r0" \
    "expat>=2.4.9-r0" \
    "groff>=1.22.4-r1" \
    "krb5-conf>=1.0-r2" \
    "krb5-libs>=1.18.3-r0" \
    "less>=551-r0" \
    "libcrypto1.1>=1.1.1i-r0" \
    "libssl1.1>=1.1.1i-r0" \
    "libtirpc>=1.2.6-r0" \
    "musl>=1.2.2_pre2-r0"

RUN pip install --upgrade "pip>=20.3.3"
RUN pip install --upgrade "awscli>=1.19.44"
RUN bash -c 'echo complete -C '/usr/local/bin/aws_completer' aws  >> $HOME/.bashrc'

COPY ./run_tests.sh /var/run_tests.sh

WORKDIR /aws
ENTRYPOINT [ "/usr/local/bin/aws" ]