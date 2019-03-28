FROM circleci/ruby:2.3.8-stretch-node-browsers

# Install qt 4.8.X (for capybara-webkit gem) and also
# postgresql-client and mysql-client
RUN sudo apt-get update \
  && sudo apt-get install -y \
    gcc g++ make \
    qt4-default libqt4-webkit \
    ruby-dev zlib1g-dev \
    postgresql-client mysql-client \
  && sudo rm -rf /var/lib/apt/lists/*

WORKDIR /home/circleci
