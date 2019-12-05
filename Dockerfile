FROM circleci/ruby:2.6.5-node-browsers-legacy

# Install qt 4.8.X (for capybara-webkit gem) and also
# postgresql-client and mysql-client
RUN sudo wget "https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb" && \
  sudo dpkg -i "mysql-apt-config_0.8.14-1_all.deb" && \
  sudo apt-get update && \
  sudo apt-get install -y --no-install-recommends \
    gcc g++ make \
    qt4-default libqtwebkit4 \
    ruby-dev zlib1g-dev \
    postgresql-client mysql-client \
    phantomjs && \
  sudo rm -rf /var/lib/apt/lists/*
WORKDIR /home/circleci
