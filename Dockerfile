FROM cimg/ruby:3.1.3-browsers

# Install mysql-client for databases
# and node/yarn for Webpacker
RUN sudo rm /usr/local/bin/node \
  && curl -sL https://deb.nodesource.com/setup_16.x | sudo bash - \
  && sudo apt-get install -y \
    nodejs \
    default-mysql-client \
  && sudo rm -rf /var/lib/apt/lists/*

WORKDIR /home/circleci
