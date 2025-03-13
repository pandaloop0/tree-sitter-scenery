// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterScenery",
    products: [
        .library(name: "TreeSitterScenery", targets: ["TreeSitterScenery"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterScenery",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
                // NOTE: if your language has an external scanner, add it here.
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterSceneryTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterScenery",
            ],
            path: "bindings/swift/TreeSitterSceneryTests"
        )
    ],
    cLanguageStandard: .c11
)
