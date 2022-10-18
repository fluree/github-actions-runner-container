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

user=$(whoami)

if [ -n "${DOCKER_GROUP_GID}" ]; then
  sudo groupadd --gid ${DOCKER_GROUP_GID} docker
  sudo usermod -aG docker ${user}
fi

wd=$(pwd)

exec sudo -i -u ${user} sh -c "cd \"${wd}\"; exec ./run.sh"

# for debugging
# exec sudo -i -u ${user} sh -c "cd \"${wd}\"; exec bash"
