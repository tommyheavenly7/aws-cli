#!/bin/sh

if ! [ -x "$(command -v aws)" ]; then
  echo 'Error: aws is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v aws_completer)" ]; then
  echo 'Error: aws_completer is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v groff)" ]; then
  echo 'Error: groff is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v less)" ]; then
  echo 'Error: less is not installed.' >&2
  exit 1
fi
