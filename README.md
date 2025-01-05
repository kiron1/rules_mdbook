# `rules_mdbook` - mdBook for Bazel

This repository contains a Bazel module which can be used to build mdBook
documentation via Bazel.

[More information about mdBook](https://rust-lang.github.io/mdBook/).

See the [documentation](https://kiron1.github.io/rules_mdbook/) or the
[examples](./doc) on how to use this `rules_mdbook` module.

# Quick usage guide

For the `MODULE.bazel` file:

```py
bazel_dep(name = "rules_mdbook", version = "0.0.1")
# Until `rules_mdbook` is included in the BCR, we can use `archive_override`
archive_override(
    module_name = "rules_mdbook",
    urls = ["https://github.com/kiron1/rules_mdbook/archive/refs/tags/v0.0.1.tar.gz"],
    strip_prefix = "rules_mdbook-0.0.1/",
    integrity = "sha256-U2ZQ/w89JLBcAbN6gffga5I2HcjGl4SEJG3MrNujlME=",
)
```

In a `BUILD.bazel` file:

```py
load("//mdbook:defs.bzl", "md_book")

md_book(
    name = "book",
    srcs = [
        "SUMMARY.md",
        "...",
    ],
    authors = ["Example"],
    title = "Example mdBook",
)
```
