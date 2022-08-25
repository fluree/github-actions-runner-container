ARG PLATFORM
ARG ARCH

FROM ubuntu

ARG RUNNER_VERSION
ARG REPO_URL
ARG TOKEN

RUN adduser --disabled-password --gecos '' github

RUN mkdir -p /home/github/action-runner
WORKDIR /home/github/action-runner

RUN apt-get update && apt-get install -y sudo ca-certificates

COPY https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-${PLATFORM}-${ARCH}-${RUNNER_VERSION}.tar.gz .

RUN tar xzf ./actions-runner-*.tar.gz

# RUN ./bin/installdependencies.sh && cd bin && \
#     ln -s System.Security.Cryptography.Native.OpenSsl.so libSystem.Security.Cryptography.Native.OpenSsl.so && \
#     ln -s System.IO.Compression.Native.so libSystem.IO.Compression.Native.so

RUN ./config-sh --url ${REPO_URL} --token ${TOKEN}

RUN chown -R github .

USER github

CMD ["./run.sh"]
