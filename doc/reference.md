# Rules Reference

## `md_book`

```py
load("@rules_mdbook//mdbook:defs.bzl", "md_book")
```

```py
md_book(name, srcs, data, authors, title)
```

The rule to generate a mdBook from some source markdown files.

| Name    | Description                                                                                    | Type                                                     | Mandatory | Default |
| ------- | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------- | --------- | ------- |
| name    | A unique name for this target.                                                                 | [Name](https://bazel.build/concepts/labels#target-names) | required  |         |
| srcs    | List of Markdown source `*md` files. Must contain one entry named `SUMMARY.md                  | [List of labels](https://bazel.build/concepts/labels)    | required  |         |
| data    | List of files used by this rule at compile time e.g., for files used with the `include` macro. | [List of labels](https://bazel.build/concepts/labels)    | optional  |         |
| authors | List of authors who creates this book.                                                         | List of strings                                          | optional  | `[]`    |
| title   | Title of this book.                                                                            | Stirng                                                   | required  |         |
