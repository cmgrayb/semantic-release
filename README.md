# Semantic-release automatic versioning container

## Description

This container is used to automatically version your project using
[semantic-release](https://semantic-release.gitbook.io/semantic-release).

## Usage

```bash
docker run --rm -v $(pwd):/data --workdir data ghcr.io/cmgrayb/semantic-release [options]
```

## Options

The container supports all the options that `semantic-release` supports. The list of options may be found
[here](https://semantic-release.gitbook.io/semantic-release/usage/configuration#options).

## Git configuration

Git configuration is required for `semantic-release` to work. Use of environment variables is recommended. The lists of
Git-related environment variables for semantic-release
[here](https://semantic-release.gitbook.io/semantic-release/usage/configuration#options) and
[here](https://semantic-release.gitbook.io/semantic-release/usage/ci-configuration#authentication).

## Semantic-relase configuration

The container will look for a `.releaserc` file in the root of your project. If it does not find one, it will use the
default configuration. You can find the full list of options
[here](https://semantic-release.gitbook.io/semantic-release/usage/configuration#options).
