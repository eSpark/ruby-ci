FROM circleci/ruby:2.7.0-node-browsers-legacy

# Install qt 4.8.X (for capybara-webkit gem) and also
# postgresql-client and mysql-client
RUN sudo apt-get update \
  && sudo apt-get install -y \
    gcc g++ make \
    qt4-default libqtwebkit4 \
    ruby-dev zlib1g-dev \
    postgresql-client mysql-client \
    phantomjs \
  && sudo rm -rf /var/lib/apt/lists/*

WORKDIR /home/circleci
