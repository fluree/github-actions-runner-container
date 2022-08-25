FROM ubuntu

ARG TARGETOS
ARG TARGETARCH

ARG RUNNER_VERSION

RUN adduser --disabled-password --gecos '' github

RUN mkdir -p /home/github/action-runner
WORKDIR /home/github/action-runner

RUN apt-get update && apt-get install -y sudo ca-certificates curl

RUN curl -sLO https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-${TARGETOS}-${TARGETARCH}-${RUNNER_VERSION}.tar.gz && \
    tar xzf ./actions-runner-*.tar.gz && rm ./actions-runner-*.tar.gz

RUN ./bin/installdependencies.sh

RUN chown -R github .
USER github

COPY ./startup.sh .
CMD ["./startup.sh"]
