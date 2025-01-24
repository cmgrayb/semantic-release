FROM node:23-bullseye-slim AS builder

RUN set -eux \
	&& apt-get update \
    && apt-get install \
    -y \
    --no-install-recommends \
    git-core \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

FROM builder AS default
ARG VERSION="latest"
RUN set -eux \
	&& if [ "${VERSION}" = "latest" ]; then \
        npm install -D -g \
        semantic-release \
        @semantic-release/changelog \
        @semantic-release/git \
        @semantic-release/exec \
	else \
        npm install -D -g \
        semantic-release@${VERSION} \
        @semantic-release/changelog@${VERSION} \
        @semantic-release/git@${VERSION} \
        @semantic-release/exec@${VERSION} \
	fi \
	&& npm cache clean --force
LABEL "org.opencontainers.image.licenses"="MIT"
LABEL "org.opencontainers.image.ref.name"="semantic-release ${VERSION}"
LABEL "org.opencontainers.image.title"="semantic-release ${VERSION}"
LABEL "org.opencontainers.image.description"="semantic-release ${VERSION}"

FROM builder AS gitlab
ARG VERSION="latest"
RUN set -eux \
	&& if [ "${VERSION}" = "latest" ]; then \
        npm install -D -g \
        semantic-release \
        @semantic-release/changelog \
        @semantic-release/git \
        @semantic-release/gitlab \
        @semantic-release/exec \
	else \
        npm install -D -g \
        semantic-release@${VERSION} \
        @semantic-release/changelog@${VERSION} \
        @semantic-release/git@${VERSION} \
        @semantic-release/exec@${VERSION} \
	fi \
	&& npm cache clean --force
LABEL "org.opencontainers.image.licenses"="MIT"
LABEL "org.opencontainers.image.ref.name"="semantic-release ${VERSION}"
LABEL "org.opencontainers.image.title"="semantic-release ${VERSION}"
LABEL "org.opencontainers.image.description"="semantic-release ${VERSION}"

ENTRYPOINT ["npx", "semantic-release"]
CMD ["--help"]
