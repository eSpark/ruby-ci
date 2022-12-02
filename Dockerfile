FROM cimg/ruby:3.1.3-browsers

# Install mysql-client for databases
# and node/yarn for Webpacker
RUN sudo apt-get update \
  && sudo apt-get install -y \
    default-mysql-client \
  && sudo rm -rf /var/lib/apt/lists/*

WORKDIR /home/circleci
