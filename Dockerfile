FROM ubuntu

ARG TARGETOS
ARG TARGETARCH

ARG RUNNER_VERSION
ARG REPO_URL
ARG TOKEN

RUN adduser --disabled-password --gecos '' github

RUN mkdir -p /home/github/action-runner
WORKDIR /home/github/action-runner

RUN apt-get update && apt-get install -y sudo ca-certificates

ADD https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-${TARGETOS}-${TARGETARCH}-${RUNNER_VERSION}.tar.gz .

RUN tar xzf ./actions-runner-*.tar.gz

# RUN ./bin/installdependencies.sh && cd bin && \
#     ln -s System.Security.Cryptography.Native.OpenSsl.so libSystem.Security.Cryptography.Native.OpenSsl.so && \
#     ln -s System.IO.Compression.Native.so libSystem.IO.Compression.Native.so

RUN ./bin/installdependencies.sh

RUN chown -R github .
USER github

RUN ./config.sh --unattended --replace --url ${REPO_URL} --token ${TOKEN}

CMD ["./run.sh"]
