FROM ruby:2.3.4

RUN  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
      && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
      && apt-get update \
      && apt-get install -y google-chrome-stable \
      && rm -rf /var/lib/apt/lists/*

RUN printf "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && apt-get update \
  && apt-get install --no-install-recommends -y \
          cron graphviz imagemagick less \
          gcc g++ make \
          postgresql-client-9.6 mysql-client \
          qt5-default libqt5webkit5-dev \
          ruby-dev zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*
