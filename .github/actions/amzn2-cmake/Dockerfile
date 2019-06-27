FROM amazonlinux:2

LABEL "com.github.actions.name"="amzn2 cmake"
LABEL "com.github.actions.description"="provides an amzn2 build environment with cmake"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/eltorocorp/s2geometry"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Loki Coyote <lokkju@gmail.com>"

RUN yum install -y cmake make gcc gcc-c++ openssl-devel gtest-devel

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
