FROM node:23.3.0-alpine3.19 AS builder

RUN set -eux \
	&& apk update \
    && apk add --no-cache \
    git \
    ca-certificates

FROM builder AS default
ARG VERSION="latest"
RUN set -eux \
    && npm install -g npm@11.0.0 \
    && npm install -D -g \
    semantic-release@${VERSION} \
    @semantic-release/changelog@${VERSION} \
    @semantic-release/git@${VERSION} \
    @semantic-release/exec@${VERSION} \
	&& npm cache clean --force
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.ref.name="semantic-release ${VERSION}"
LABEL org.opencontainers.image.title="semantic-release ${VERSION}"
LABEL org.opencontainers.image.description="semantic-release ${VERSION}"
ENTRYPOINT ["npx", "semantic-release"]
