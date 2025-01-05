# `rules_mdbook` - mdBook for Bazel

This repository contains a Bazel module which can be used to build mdBook
documentation via Bazel.

[More information about mdBook](https://rust-lang.github.io/mdBook/).

See the [documentation](https://kiron1.github.io/rules_mdbook/) or the
[examples](./doc) on how to use this `rules_mdbook` module.

# Quick usage guide

For the `MODULE.bazel` file:

```py
bazel_dep(name = "rules_mdbook", version = "0.0.0")
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
