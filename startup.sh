#!/bin/sh

if [ -z "${REPO_URL}" ]; then
  echo "REPO_URL must be set to e.g. https://github.com/org/repo"
  exit 1
fi

if [ -z "${TOKEN}" ]; then
  echo "TOKEN must be set to the GitHub-provided token for adding this runner"
  exit 1
fi

./config.sh --unattended --replace --url ${REPO_URL} --token ${TOKEN}

exec ./run.sh
