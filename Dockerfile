FROM ubuntu:22.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG RUNNER_VERSION="2.303.0"

ENV DEBIAN_FRONTEND noninteractive

RUN set -eux; \
    apt-get update -y ; \
    apt-get dist-upgrade -y ; \
    apt-get install curl jq ca-certificates --no-install-recommends -y ; \
    useradd -m docker ; \
    cd /home/docker ; \
    mkdir actions-runner ; \
    cd actions-runner ; \
    curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz ; \
    tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz ; \
    chown -R docker /home/docker/ ; \
    /home/docker/actions-runner/bin/installdependencies.sh

COPY start.sh start.sh

RUN chmod +x start.sh

USER docker

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

CMD ["start.sh"]
