// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "LabeledContentInteractiveFocus",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "LabeledContentInteractiveFocus",
            targets: ["LabeledContentInteractiveFocus"]
        )
    ],
    targets: [
        .target(
            name: "LabeledContentInteractiveFocus"
        )
    ]
)
