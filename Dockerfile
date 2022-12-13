FROM cimg/ruby:3.1.3-browsers

# Install mysql-client for databases
# and node/yarn for Webpacker
RUN sudo rm /usr/local/bin/node \
  && curl -sL https://deb.nodesource.com/setup_16.x | sudo bash - \
  && sudo apt-get install -y \
    google-chrome-stable \
    default-mysql-client \
    nodejs \
  && sudo rm -rf /var/lib/apt/lists/* \
  # install phantomjs
  && wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && sudo mv phantomjs-2.1.1-linux-x86_64 /usr/local/share \
  && sudo ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin \
  && rm phantomjs-2.1.1-linux-x86_64.tar.bz2

WORKDIR /home/circleci
