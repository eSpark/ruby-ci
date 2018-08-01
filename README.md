# Ruby CI

[Docker Hub](https://hub.docker.com/r/gnarmis/ruby-ci/)

A simplistic Ruby Docker image which includes things that
are essential for testing in CI.

- qt (5.x) and xvfb -- allows things like capybara-webkit to work
- mysql-client and postgresql-client (9.6)
- node 8.11.3 and yarn 1.6.0

`gnarmis/ruby-ci:2.3.4` is the image name. Right now, no other
ruby versions are supported, but you could customize this for your own needs
by just adjusting the first line of `Dockerfile`.

To try it out:

    docker build . -t gnarmis/ruby-ci:2.3.4
    docker run --rm -it gnarmis/ruby-ci:2.3.4 bash
