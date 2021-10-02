# Minify CSS plugin for Publish

A [Publish](https://github.com/johnsundell/publish) plugin to minify CSS files in the output folder.

This leaves the original CSS files untouched and thus human-readable. Minifying the CSS files in the output folder comes with the benefit of reduced filesize and therefore a decreased loading time of your website.

## Installation

To install it into your [Publish](https://github.com/johnsundell/publish) package, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        ...
        .package(name: "MinifyCSSPublishPlugin", url: "https://github.com/labradon/minifycsspublishplugin", from: "0.1.0")
    ],
    targets: [
        .target(
            ...
            dependencies: [
                ...
                "MinifyCSSPublishPlugin"
            ]
        )
    ]
    ...
)
```

Then import MinifyCSSPublishPlugin wherever you’d like to use it:

```swift
import MinifyCSSPublishPlugin
```

For more information on how to use the Swift Package Manager, check out [this article](https://www.swiftbysundell.com/articles/managing-dependencies-using-the-swift-package-manager), or [its official documentation](https://github.com/apple/swift-package-manager/tree/master/Documentation).

## Usage

The plugin can then be used within any publishing pipeline like this:

```swift
import MinifyCSSPublishPlugin
...
try Website().publish(using: [
    ...
    .installPlugin(.minifyCSS()),
    ...
])
```

Note, that the css files must already be present in the output folder at the corresponding step in the publishing pipeline. It is therefore best to add this step after `.copyResources()` (or `.generateHTML(...)` if you're using a theme with bundled css files).

The wildcard `.minifyCSS()` method minifies all css files in the top level of the output folder. If you wish to minify all css files in a subfolder of the output folder, use `.minifyCSS(in: ...)`.

```swift
import MinifyCSSPublishPlugin
...
try Website().publish(using: [
    ...
    .installPlugin(.minifyCSS(in: "styles")),
    ...
])
```

If you wish to minify a specific css file, use `.minifyCSS(at: ...)`.

```swift
import MinifyCSSPublishPlugin
...
try Website().publish(using: [
    ...
    .installPlugin(.minifyCSS(at: "styles/layout.css")),
    ...
])
```
