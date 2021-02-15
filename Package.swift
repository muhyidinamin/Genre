// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Genre",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Genre",
            targets: ["Genre"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
      .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", from: "10.5.1"),
      .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.1")),
      .package(path: "../Core")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Genre",
            dependencies: [
              .product(name: "RealmSwift", package: "Realm"),
              "Core",
              "Alamofire"
            ]),
        .testTarget(
            name: "GenreTests",
            dependencies: ["Genre"]),
    ]
)
