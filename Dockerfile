FROM cimg/ruby:4.0.4-browsers

# install nodejs
USER root
ENV NODE_VERSION=20.11.0
RUN  rm -rf /usr/local/bin/nodejs /usr/local/bin/npm /usr/local/bin/npx /usr/local/bin/corepack /usr/local/lib/node_modules \
  [[ $(uname -m) == "x86_64" ]] && ARCH="x64" || ARCH="arm64" && \
 	curl -L -o node.tar.xz "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${ARCH}.tar.xz" && \
	sudo tar -xJf node.tar.xz -C /usr/local --strip-components=1 && \
	rm node.tar.xz && \
	sudo ln -s /usr/local/bin/node /usr/local/bin/nodejs

# install/update other tools
RUN apt-get update \
  && apt-get install -y \
    default-mysql-client \
    ffmpeg \
    libvips-tools \
  && rm -rf /var/lib/apt/lists/*

USER circleci

WORKDIR /home/circleci
