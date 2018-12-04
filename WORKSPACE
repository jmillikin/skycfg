load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "io_bazel_rules_go",
    urls = ["https://github.com/bazelbuild/rules_go/releases/download/0.16.3/rules_go-0.16.3.tar.gz"],
    sha256 = "b7a62250a3a73277ade0ce306d22f122365b513f5402222403e507f2f997d421",
    patches = ["@//:rules-go-wasm.patch"],
    patch_args = ["-p1"],
)
http_archive(
    name = "bazel_gazelle",
    urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/0.15.0/bazel-gazelle-0.15.0.tar.gz"],
    sha256 = "6e875ab4b6bf64a38c352887760f21203ab054676d9c1b274963907e0768740d",
)
load("@io_bazel_rules_go//go:def.bzl", "go_rules_dependencies", "go_register_toolchains")
go_rules_dependencies()
go_register_toolchains("1.11.2")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")
gazelle_dependencies()

go_repository(
    name = "net_starlark_go",
    importpath = "go.starlark.net",
    commit = "5c7d5aa7ed56b35691775864b8a5e97329a916e5",  # HEAD
)

go_repository(
    name = "in_gopkg_yaml_v2",
    importpath = "gopkg.in/yaml.v2",
    commit = "51d6538a90f86fe93ac480b35f37b2be17fef232", # v2.2.2
)

go_repository(
    name = "com_github_golang_protobuf",
    importpath = "github.com/golang/protobuf",
    commit = "aa810b61a9c79d51363740d207bb46cf8e620ed5", # v1.2.0
)

load(":kubernetes.bzl", "k8s_go_repository")

k8s_go_repository(
    name = "io_k8s_apimachinery",
    urls = ["https://github.com/kubernetes/apimachinery/archive/kubernetes-1.13.0.tar.gz"],
    sha256 = "f9cce8e8428ee3c78d79a018b53abb5f58e65a494036ff9eaacc8f066666caed",
    importpath = "k8s.io/apimachinery",
    strip_prefix = "apimachinery-kubernetes-1.13.0",
)

k8s_go_repository(
    name = "io_k8s_api",
    urls = ["https://github.com/kubernetes/api/archive/kubernetes-1.10.3.tar.gz"],
    sha256 = "8b19e7b4c40467e1c74f240da7ee3efa3a222b22da923a39198bd1bbe8f58b39",
    importpath = "k8s.io/api",
    strip_prefix = "api-kubernetes-1.10.3",
)

k8s_go_repository(
    name = "io_k8s_apiextensions_apiserver",
    urls = ["https://github.com/kubernetes/apiextensions-apiserver/archive/kubernetes-1.13.0.tar.gz"],
    sha256 = "3e84802b91a382d736fe60fd29686b99876887b1019911feed75aaaf9e20d574",
    importpath = "k8s.io/apiextensions-apiserver",
    strip_prefix = "apiextensions-apiserver-kubernetes-1.13.0",
)
