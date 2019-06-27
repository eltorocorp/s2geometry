FROM buildpack-deps:bionic-scm

LABEL "com.github.actions.name"="s2geometry builder"
LABEL "com.github.actions.description"="provides a build environment for s2geometry"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/eltorocorp/s2geometry"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Loki Coyote <lokkju@gmail.com>"

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
