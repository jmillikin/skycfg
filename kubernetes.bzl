def _exec(ctx, cmd):
    rc = ctx.execute(cmd)
    if rc.return_code:
        fail("%s:\n%s" % (cmd[0], rc.stderr))

def _k8s_go_repository(ctx):
    ctx.download_and_extract(
        url = ctx.attr.urls,
        sha256 = ctx.attr.sha256,
        stripPrefix = ctx.attr.strip_prefix,
        output = ctx.attr.importpath,
    )

    _exec(ctx, ["rm", "-rf", "vendor"])
    _exec(ctx, ["find", ".", "-name", "*.go", "-delete"])

    gazelle = ctx.path(Label("@bazel_gazelle_go_repository_tools//:bin/gazelle"))
    gazelle_cmd = [
        gazelle,
        "--go_prefix", ctx.attr.importpath,
        "--mode", "fix",
        "--repo_root", ctx.path(ctx.attr.importpath),
        ctx.attr.importpath,
    ]

    _exec(ctx, gazelle_cmd)

    if ctx.attr.name != "io_k8s_apimachinery":
        _exec(ctx, ["find", ".", "-name", "BUILD.bazel", "-exec", "sed", "-i.bak", "s#//k8s.io/apimachinery/#@io_k8s_apimachinery//k8s.io/apimachinery/#", "{}", ";"])
    if ctx.attr.name != "io_k8s_apiextensions_apiserver":
        _exec(ctx, ["find", ".", "-name", "BUILD.bazel", "-exec", "sed", "-i.bak", "s#//k8s.io/apiextensions-apiserver/#@io_k8s_apiextensions_apiserver//k8s.io/apiextensions-apiserver/#", "{}", ";"])

k8s_go_repository = repository_rule(
    _k8s_go_repository,
    attrs = {
        "urls": attr.string_list(),
        "sha256": attr.string(),
        "strip_prefix": attr.string(),
        "importpath": attr.string(),
    },
)
