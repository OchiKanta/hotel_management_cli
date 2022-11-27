// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "hotel_management_cli",
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0"),
    ],
    targets: [
        .executableTarget(
            name: "hotel_management_cli",
            dependencies: [
                .product(name: "RxSwift", package: "rxswift"),
            ]),
    ]
)
