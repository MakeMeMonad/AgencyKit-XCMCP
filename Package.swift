// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AgencyKitXCMCP",
    platforms: [
	.macOS(.v13),
	       ],
    dependencies: [
	.package(url: "https://github.com/modelcontextprotocol/swift-sdk.git", .upToNextMinor(from: "0.8.2")),
    ],
    targets: [
        .executableTarget(
            name: "AgencyKitXCMCP",
	    dependencies: [
		.product(name: "MCP", package: "swift-sdk"),
	    ]
	),
	.testTarget(
		name: "AgencyKitXCMCPTests",
		dependencies: ["AgencyKitXCMCP"]
	),
    ]
)
