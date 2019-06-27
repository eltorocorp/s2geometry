FROM buildpack-deps:bionic

LABEL "com.github.actions.name"="s2geometry builder"
LABEL "com.github.actions.description"="provides a build environment for s2geometry"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/eltorocorp/s2geometry"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Loki Coyote <lokkju@gmail.com>"

RUN apt update && apt install -y cmake libssl-dev libgtest-dev

RUN cd /usr/src/gtest && cmake CMakeLists.txt && make && cp *.a /usr/lib

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
