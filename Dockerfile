FROM cimg/ruby:3.2.1-browsers

# Install mysql-client for databases
# and node/yarn for Webpacker
RUN sudo rm /usr/local/bin/node \
  && curl -sL https://deb.nodesource.com/setup_16.x | sudo bash - \
  && sudo apt-get install -y \
    google-chrome-stable \
    default-mysql-client \
    nodejs \
    build-essential chrpath libssl-dev libxft-dev \
    libfreetype6 libfreetype6-dev \
    libfontconfig1 libfontconfig1-dev \
  && sudo rm -rf /var/lib/apt/lists/* \
  # install phantomjs
  && wget https://github.com/Medium/phantomjs/releases/download/v2.1.1/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && sudo mv phantomjs-2.1.1-linux-x86_64 /usr/local/share \
  && sudo ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin \
  && rm phantomjs-2.1.1-linux-x86_64.tar.bz2

WORKDIR /home/circleci
