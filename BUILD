load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "skycfg",
    srcs = ["skycfg.go"],
    importpath = "github.com/stripe/skycfg",
    deps = [
        "//internal/go/skycfg",
        "@com_github_golang_protobuf//proto:go_default_library",
        "@net_starlark_go//starlark:go_default_library",
        "@net_starlark_go//starlarkstruct:go_default_library",
    ],
)

# bazel build //:wasm_demo --define=gotags=js
go_binary(
    name = "wasm_demo",
    srcs = ["_examples/wasm/main.go"],
    goos = "js",
    goarch = "wasm",
    pure = "on",
    deps = [
        ":skycfg",
        "@com_github_golang_protobuf//jsonpb:go_default_library",
        "@com_github_golang_protobuf//proto:go_default_library",
        "@in_gopkg_yaml_v2//:go_default_library",
        "@io_k8s_api//k8s.io/api/apps/v1:go_default_library",
        "@io_k8s_api//k8s.io/api/batch/v1:go_default_library",
        "@io_k8s_api//k8s.io/api/core/v1:go_default_library",
        "@io_k8s_api//k8s.io/api/storage/v1:go_default_library",
    ],
)

