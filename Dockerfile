# syntax=docker/dockerfile:1.3.0
FROM ruby:3.0.2-alpine3.14 AS ruby

FROM ruby AS base
RUN addgroup -g 1000 -S dude && adduser -u 1000 -G dude -S dude

COPY --chown=dude .runtime-deps /.runtime-deps
RUN --mount=type=cache,id=apk_cache,target=/var/cache/apk \
    cat .runtime-deps | xargs apk add -U

USER dude
WORKDIR /app

COPY docker-entrypoint.sh /app/docker-entrypoint.sh
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
EXPOSE 3000

##################################### BUILD ####################################
FROM base AS build
USER root
COPY --chown=dude .build-deps /.build-deps
RUN --mount=type=cache,id=apk_cache,target=/var/cache/apk \
    cat /.build-deps | xargs apk add -U
##################################### BUILD ####################################

###################################### DEV #####################################
FROM build AS dev
# Bind mount source code to /app. Mount volume to /usr/local/bundle
# Mount volume to /app/node_modules. Mount tmpfs to /app/tmp
VOLUME [ "/app/node_modules", "/usr/local/bundle" ]
CMD [ "echo", "MOUNT SOURCE CODE AS BIND, OR USE DOCKER-COMPOSE" ]
###################################### DEV #####################################