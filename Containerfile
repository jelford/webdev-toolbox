FROM registry.fedoraproject.org/fedora-toolbox:33

# When running locally, use the developer cache as normal.
ARG UPDATE_AS_OF=NONE

RUN echo "Updates will be applied using cache busting key: ${UPDATE_AS_OF}"
RUN dnf update --all -y
RUN dnf groupinstall -y "Development Tools"
RUN dnf install -y chromium firefox nodejs npm chromedriver
RUN dnf install -y fish zsh direnv vim emacs

ARG GECKODRIVER_VERSION=0.29.0
RUN cd /tmp && \
    curl -sSL "https://github.com/mozilla/geckodriver/releases/download/v${GECKODRIVER_VERSION}/geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz" -o "geckodriver.tar.gz" && \
    tar -xzf ./geckodriver.tar.gz && \
    chmod +x ./geckodriver && \
    mv geckodriver /usr/bin && \
    rm -r ./geckodriver.tar.gz && \
    cd -
