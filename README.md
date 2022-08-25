# GitHub Self-hosted Actions Runner

## Usage

1. Go to https://github.com/organizations/fluree/settings/actions/add-new-runner?arch=x64&os=linux
   to add a new Linux runner.
1. Build the Docker image: `docker buildx build --build-arg RUNNER_VERSION=2.296.0 --load -t fluree/github-actions-runner:2.296.0 .`.
1. Run it: `docker run -d --hostname=nexus-backend-actions --restart=unless-stopped --env REPO_URL=https://github.com/fluree/nexus-backend --env TOKEN=whatever fluree/github-actions-runner`.
