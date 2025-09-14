// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "flutter_webrtc_fixed_v0_12_0",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_14),
    ],
    products: [
        .library(
            name: "flutter_webrtc_fixed_v0_12_0",
            targets: ["flutter_webrtc_fixed_v0_12_0"]
        ),
    ],
    dependencies: [
        // Flutter dependencies are handled by the Flutter framework
    ],
    targets: [
        .target(
            name: "flutter_webrtc_fixed_v0_12_0",
            dependencies: [],
            path: "ios/Classes",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .define("WEBRTC_IOS", to: "1"),
                .define("WEBRTC_MAC", to: "1"),
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreAudio"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("Foundation"),
                .linkedFramework("GLKit"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("Security"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("VideoToolbox"),
            ]
        ),
    ]
)
