FROM cimg/ruby:3.0-browsers

# Install mysql-client for databases
# and node/yarn for Webpacker
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
  && sudo apt-get update \
  && sudo apt-get install -y \
    default-mysql-client \
    ffmpeg \
    nodejs \
    yarn \
    phantomjs \
  && sudo rm -rf /var/lib/apt/lists/*

# the base image comes with an older version of Node that takes precedence given the path
RUN sudo rm /usr/local/bin/node

WORKDIR /home/circleci
