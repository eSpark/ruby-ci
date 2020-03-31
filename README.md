# Ruby CI

[Docker Hub](https://hub.docker.com/r/esparklearning/ruby-ci/)

Based on a CircleCI image, but adds qt 4.

Current Image: `esparklearning/ruby-ci:2.5.3-node-browsers-legacy`

To build a new image:

We base our versions on [Circle CI's Ruby images](https://hub.docker.com/r/circleci/ruby/). Update
the Dockerfile accordingly and, once it builds, run:

1. `docker build -t ${VERSION} .`
2. `docker tag ${VERSION} esparklearning/ruby-ci/${VERSION}`
3. `docker push docker push esparklearning/ruby-ci:${VERSION}`
