FROM cimg/ruby:3.4.9-browsers

# install nodejs
USER root
ENV NODE_VERSION=20.11.0
RUN  set -eux; \
  rm -f /usr/local/bin/node /usr/local/bin/nodejs /usr/local/bin/npm /usr/local/bin/npx /usr/local/bin/corepack; \
  rm -f /usr/local/bin/pnpm /usr/local/bin/pnpx /usr/local/bin/yarn /usr/local/bin/yarnpkg; \
  rm -rf /usr/local/lib/node_modules; \
  if [ "$(uname -m)" = "x86_64" ]; then ARCH="x64"; else ARCH="arm64"; fi; \
  curl -fsSL -o /tmp/node.tar.xz "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${ARCH}.tar.xz"; \
  tar -xJf /tmp/node.tar.xz -C /usr/local --strip-components=1; \
  rm -f /tmp/node.tar.xz; \
  ln -sf /usr/local/bin/node /usr/local/bin/nodejs; \
  npm install -g corepack@latest; \
  corepack enable

# install/update other tools
RUN apt-get update \
  && apt-get install -y \
    default-mysql-client \
    ffmpeg \
    libvips-tools \
  && rm -rf /var/lib/apt/lists/*

USER circleci

WORKDIR /home/circleci
