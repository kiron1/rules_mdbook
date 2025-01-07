def _no(attr):
    return "" if attr else "# "

def _md_book_impl(ctx):
    summary_md = [f for f in ctx.files.srcs if f.basename == "SUMMARY.md"]
    if len(summary_md) == 0:
        fail("SUMMARY.md file missing in srcs")
    if len(summary_md) > 1:
        fail("Only one SUMMARY.md file in srcs allowed, provided {}".format(len(summary_md)))

    dest_dir = ctx.actions.declare_directory("{}.mdbook".format(ctx.label.name))

    # mdBook works relative from the root directory (which is the directory with the book.toml file), but
    # Bazel expects us to work from the work from the output_path / bazel-bin path.
    # Additionally output files and srcs are in a different hirachy within the output_path / bazel-bin path.
    # Create symlinks to all srcs and data files to make the output hirachy look like what the user will expect.
    outputs = [(ctx.actions.declare_file(f.path[len(ctx.label.package) + 1:]), f) for f in ctx.files.srcs]
    for (o, t) in outputs:
        ctx.actions.symlink(output = o, target_file = t)

    book_toml = ctx.actions.declare_file("book.toml")

    ctx.actions.expand_template(
        template = ctx.file._book_toml_template,
        output = book_toml,
        substitutions = {
            "{TITLE}": ctx.attr.title,
            "{AUTHORS}": '["{}"]'.format('", "'.join(ctx.attr.authors)),
            "{NOAUTHORS}": _no(ctx.attr.authors),
            "{SRC}": ".",
            "{BUILD_DIR}": dest_dir.basename,
        },
    )

    mdbookinfo = ctx.toolchains["//mdbook:toolchain_type"].mdbookinfo
    arguments = ["build", book_toml.dirname]
    ctx.actions.run(
        mnemonic = "mdBook",
        progress_message = "mdbook %{output}",
        inputs = depset(
            # direct = ctx.files.srcs + ctx.files.data + [book_toml],
            direct = [o[0] for o in outputs] + ctx.files.data + [book_toml],
        ),
        outputs = [dest_dir],
        executable = mdbookinfo.compiler_path,
        arguments = arguments,
        env = {
            # "RUST_LOG": "debug",
        },
    )
    return [
        DefaultInfo(files = depset([dest_dir])),
    ]

md_book = rule(
    implementation = _md_book_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = [".md"], mandatory = True, doc = "Markdown source files of the Book"),
        "data": attr.label_list(allow_files = True, mandatory = False, doc = "Additional datas files required for the Book (e.g. used via the include macro)"),
        "title": attr.string(doc = "Title of the Book", default = ""),
        "authors": attr.string_list(doc = "Authors of the Book", default = []),
        "_book_toml_template": attr.label(
            default = ":book.toml.tpl",
            allow_single_file = True,
        ),
    },
    toolchains = ["//mdbook:toolchain_type"],
)
