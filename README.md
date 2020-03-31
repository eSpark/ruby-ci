# Ruby CI

[Docker Hub](https://hub.docker.com/r/esparklearning/ruby-ci/)

Based on a CircleCI image, but adds QT4 and FFPMEG and nodejs/yarn.

Current Image: `esparklearning/ruby-ci:2.6.3`

To build a new image:

We base our versions on [Circle CI's Ruby images](https://hub.docker.com/r/circleci/ruby/). Update
the Dockerfile accordingly and, once it builds, run:

1. `docker build -t ${VERSION} .`
2. `docker tag ${VERSION} esparklearning/ruby-ci/${VERSION}`
3. `docker push esparklearning/ruby-ci:${VERSION}`
