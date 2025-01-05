MdBookInfo = provider(
    doc = "Information about how to invoke mdBook.",
    fields = ["compiler_path"],
)

def _mdbook_toolchain_impl(ctx):
    toolchain_info = platform_common.ToolchainInfo(
        mdbookinfo = MdBookInfo(
            compiler_path = ctx.file.compiler_path,
        ),
    )
    return [toolchain_info]

mdbook_toolchain = rule(
    implementation = _mdbook_toolchain_impl,
    attrs = {
        "compiler_path": attr.label(
            allow_single_file = True,
            executable = True,
            mandatory = True,
            cfg = "exec",
        ),
    },
)
