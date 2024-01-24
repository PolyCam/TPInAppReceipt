// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "TPInAppReceipt",
	platforms: [.macOS(.v10_13),
				.iOS(.v12),
				.tvOS(.v12),
				.watchOS("6.2"),
				.visionOS(.v1),
				],
	
    products: [
        .library(name: "TPInAppReceipt", targets: ["TPInAppReceipt"]),
		.library(name: "TPInAppReceipt-Objc", targets: ["TPInAppReceipt-Objc"]),
    ],
	dependencies: [
		.package(url: "https://github.com/polycam/ASN1Swift", revision: "8452359259c92c4f81edd94ee33341db3c5cea1c")
	],
    targets: [
        .target(
            name: "TPInAppReceipt",
			dependencies: ["ASN1Swift"],
			path: "Sources",
			exclude: ["Bundle+Private.swift", "Objc/InAppReceipt+Objc.swift"],
			resources: [.process("AppleIncRootCertificate.cer"), .process("StoreKitTestCertificate.cer")]
		),
		.target(
			name: "TPInAppReceipt-Objc",
			dependencies: ["TPInAppReceipt"],
			path: "Sources/Objc"
		),
		.testTarget(
			name: "TPInAppReceiptTests",
			dependencies: ["TPInAppReceipt"])
	],
	swiftLanguageVersions: [.v5]
)

    
