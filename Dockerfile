FROM cimg/ruby:3.2.2-browsers

# Install mysql-client for databases
# and node/yarn for Webpacker
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
  && sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
  && curl -sL https://deb.nodesource.com/setup_16.x | sudo bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
  && sudo apt-get update \
  && sudo apt-get install -y \
    default-mysql-client \
    ffmpeg \
    nodejs \
    google-chrome-stable \
    yarn \
  && sudo rm -rf /var/lib/apt/lists/*

# the base image comes with an older version of Node that takes precedence given the path
RUN sudo rm /usr/local/bin/node
ARG PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
RUN sudo apt-get update && sudo apt-get install -y build-essential chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev
RUN  wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && sudo tar xvjf $PHANTOM_JS.tar.bz2 && sudo mv $PHANTOM_JS /usr/local/share && sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
WORKDIR /home/circleci
