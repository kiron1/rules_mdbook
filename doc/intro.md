# Rules mdBook

This repository proves rules to build
[mdBooks](https://rust-lang.github.io/mdBook/) with
[Bazel](https://bazel.build/).

## Setup

The rules are released, and releases can be found on the
[GitHub Releases page](https://github.com/kiron1/rules_mdbook/releases/latest).
We recommend using the latest release from that page

### Bzlmod

See the
[GitHub Releases page](https://github.com/kiron1/rules_mdbook/releases/latest)
for a copy and past ready snippet.

### WORKSPOACE

Rules mdBook does not support the legacy Bazel WORKSPACE mode.

## Supported bazel versions

At least a bazel version with Bzlmod enabled (`--enable_bzlmod`). Currently we
test only with version 8.0.0.

## Supported platforms

We aim to provide support for Linux, macOS, and Windows. See also the
[platforms page](platforms.md).
