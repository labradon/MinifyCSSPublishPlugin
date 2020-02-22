// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "MinifyCSSPublishPlugin",
    products: [
        .library(
            name: "MinifyCSSPublishPlugin",
            targets: ["MinifyCSSPublishPlugin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "MinifyCSSPublishPlugin",
            dependencies: ["Publish"]),
        .testTarget(
            name: "MinifyCSSPublishPluginTests",
            dependencies: ["MinifyCSSPublishPlugin"]),
    ]
)
