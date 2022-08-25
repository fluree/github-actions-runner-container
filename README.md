# GitHub Self-hosted Actions Runner

## Usage

1. Go to https://github.com/organizations/fluree/settings/actions/add-new-runner?arch=x64&os=linux
   to add a new Linux runner.
1. Build the Docker image: `docker buildx build --build-arg RUNNER_VERSION=2.296.0 --build-arg REPO_URL=https://github.com/fluree/nexus-backend --build-arg TOKEN=whatever --load -t fluree/github-actions-runner-nexus-backend .`.
1. Run it: `docker run -d --restart=unless-stopped fluree/github-actions-runner-nexus-backend`.
