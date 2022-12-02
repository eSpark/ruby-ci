FROM cimg/ruby:3.1.3-browsers

# Install mysql-client for databases
# and node/yarn for Webpacker
RUN sudo apt-get update \
  && sudo apt-get install -y \
    default-mysql-client \
  && sudo rm -rf /var/lib/apt/lists/*

# the base image comes with an older version of Node that takes precedence given the path
RUN sudo rm /usr/local/bin/node

WORKDIR /home/circleci
