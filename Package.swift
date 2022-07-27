// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "rxswift-composable-architecture",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "ComposableArchitecture",
      targets: ["ComposableArchitecture"]
    ),
    .library(
      name: "ComposableCoreLocation",
      targets: ["ComposableCoreLocation"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.9.0"),
    .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
  ],
  targets: [
    .target(
      name: "ComposableArchitecture",
      dependencies: [
        .product(name: "CasePaths", package: "swift-case-paths"),
        .product(name: "RxRelay", package: "RxSwift"),
        "RxSwift",
      ]
    ),
    .testTarget(
      name: "ComposableArchitectureTests",
      dependencies: [
        "ComposableArchitecture",
        .product(name: "RxTest", package: "RxSwift")
      ]
    ),
    .target(
      name: "ComposableCoreLocation",
      dependencies: [
        "ComposableArchitecture"
      ]
    ),
    .testTarget(
      name: "ComposableCoreLocationTests",
      dependencies: [
        "ComposableCoreLocation"
      ]
    ),
  ]
)
