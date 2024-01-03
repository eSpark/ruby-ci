FROM cimg/ruby:3.3.0-browsers

# install nodejs
USER root
RUN rm -rf /usr/local/bin/node /usr/local/bin/nodejs /usr/local/bin/npm && mkdir /usr/local/nvm

ENV NODE_VERSION 16.16.0
ENV NVM_DIR /usr/local/nvm
RUN curl --silent -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# RUN which nvm
RUN . $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default \
  # smoke tests
  && node --version \
  && npm --version

# # install/update other tools
RUN apt-get update \
  && apt-get install -y \
    default-mysql-client \
    ffmpeg \
    google-chrome-stable \
  && rm -rf /var/lib/apt/lists/*

USER circleci

WORKDIR /home/circleci
