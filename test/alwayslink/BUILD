load("//rust:rust.bzl", "rust_library", "rust_test")

cc_library(
    name = "linked",
    srcs = [
        "linked.cc",
    ],
    # Compilation will fail if this is commented out.
    # alwayslink = 1,
)

rust_library(
    name = "use_linked",
    srcs = ["use_linked.rs"],
    deps = [
        ":linked",
    ],
)

rust_test(
    name = "use_linked_test",
    crate = ":use_linked",
)
