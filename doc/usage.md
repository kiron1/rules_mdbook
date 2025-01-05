# Register dependencies via Bzlmod

Add the following content into your `MODULE.bazel` file:

```py
bazel_dep(name = "rules_mdbook", version = "0.0.0")
```

# Building a mdBook

Add the following content in one of the `BUILD.bazel` files:

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

Adjust the attributes `srcs`, `authors`, and `title` accordingly. The `srcs`
attribute requires one entry to a `SUMMARY.md` file. The location of this file
defins then the `book.src` location in the `book.toml` file. For more
information see the documentation of mdBook at
https://rust-lang.github.io/mdBook/format/configuration/general.html.

You can build it then with `bazel build :book`.
