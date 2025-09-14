<div align="center">

# 🚀 Flutter WebRTC Fixed v0.12.0

[![pub package](https://img.shields.io/pub/v/flutter_webrtc_fixed_v0_12_0.svg?style=for-the-badge&logo=dart&logoColor=white)](https://pub.dartlang.org/packages/flutter_webrtc_fixed_v0_12_0)
[![GitHub stars](https://img.shields.io/github/stars/boughdiri-dorsaf/flutter_webrtc_fixed_v0.12.0?style=for-the-badge&logo=github&logoColor=white)](https://github.com/boughdiri-dorsaf/flutter_webrtc_fixed_v0.12.0)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge&logo=opensourceinitiative&logoColor=white)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![WebRTC](https://img.shields.io/badge/WebRTC-333333?style=for-the-badge&logo=webrtc&logoColor=white)](https://webrtc.org)

**🎯 Production-Ready WebRTC Plugin for Flutter**

*Cross-platform real-time communication with enhanced stability and performance*

</div>

---

## ✨ What's New

🎉 **This is a fixed and improved version** of the original `flutter_webrtc` package with:
- 🔧 **Enhanced Stability** - Additional bug fixes and optimizations
- 🚀 **Production Ready** - Tested and optimized for production use
- 📱 **Cross-Platform** - iOS, Android, Web, macOS, Windows, Linux support
- 🛠️ **Easy Integration** - Simple API with comprehensive documentation

</br>
<p align="center">
<strong>Sponsored with 💖 &nbsp by</strong><br />
<a href="https://getstream.io/chat/flutter/tutorial/?utm_source=https://github.com/flutter-webrtc/flutter-webrtc&utm_medium=github&utm_content=developer&utm_term=flutter" target="_blank">
<img src="https://stream-blog-v2.imgix.net/blog/wp-content/uploads/f7401112f41742c4e173c30d4f318cb8/stream_logo_white.png?w=350" alt="Stream Chat" style="margin: 8px" />
</a>
<br />
Enterprise Grade APIs for Feeds, Chat, & Video. <a href="https://getstream.io/video/docs/flutter/?utm_source=https://github.com/flutter-webrtc/flutter-webrtc&utm_medium=sponsorship&utm_content=&utm_campaign=webrtcFlutterRepo_July2023_video_klmh22" target="_blank">Try the Flutter Video tutorial</a> 💬
</p>

</br>
<p align="center">
<a href="https://livekit.io/?utm_source=opencollective&utm_medium=github&utm_campaign=flutter-webrtc" target="_blank">
<img src="https://avatars.githubusercontent.com/u/69438833?s=92&v=4" alt="LiveKit" style="margin: 8px" />
</a>
<br />
   <a href="https://livekit.io/?utm_source=opencollective&utm_medium=github&utm_campaign=flutter-webrtc" target="_blank">LiveKit</a> - Open source WebRTC infrastructure
<p>

## 📦 Installation

### 🎯 Quick Start (Recommended)

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_webrtc_fixed_v0_12_0: ^0.12.0
```

Then run:
```bash
flutter pub get
```

### 🔗 Alternative Installation Methods

<details>
<summary><strong>📥 From GitHub Repository</strong></summary>

```yaml
dependencies:
  flutter_webrtc_fixed_v0_12_0:
    git:
      url: https://github.com/boughdiri-dorsaf/flutter_webrtc_fixed_v0.12.0.git
      ref: main
```

</details>

<details>
<summary><strong>📁 From Local Path</strong></summary>

```yaml
dependencies:
  flutter_webrtc_fixed_v0_12_0:
    path: ./flutter_webrtc_fixed_v0_12_0
```

</details>

## 🚀 Features

<div align="center">

### 🌟 Core Capabilities

| 🎯 Feature | 🤖 Android | 🍎 iOS | 🌐 Web | 💻 macOS | 🪟 Windows | 🐧 Linux | 📱 Embedded |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **🎥 Audio/Video** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **📡 Data Channel** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **📺 Screen Capture** | ✅ | ✅* | ✅ | ✅ | ✅ | ✅ | ✅ |
| **🔄 Unified-Plan** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **📊 Simulcast** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **🎬 MediaRecorder** | ⚠️ | ⚠️ | ✅ | ❌ | ❌ | ❌ | ❌ |
| **🔐 End-to-End Encryption** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **🔌 Insertable Streams** | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |

*<sub>iOS Screen Sharing requires additional setup - [See Guide](https://github.com/flutter-webrtc/flutter-webrtc/wiki/iOS-Screen-Sharing)</sub>*

</div>

### 🎨 Key Highlights

- 🎯 **Cross-Platform Support** - Works seamlessly across all major platforms
- 🔧 **Production Ready** - Battle-tested in real-world applications
- 🚀 **High Performance** - Optimized for low latency and high quality
- 🛡️ **Secure** - Built-in encryption and security features
- 📱 **Mobile First** - Designed with mobile devices in mind
- 🌐 **Web Compatible** - Full support for Flutter Web with WASM compatibility
- 📦 **Swift Package Manager** - Native iOS/macOS support via SPM
- ⚡ **Modern Web** - WASM-compatible for better performance

Additional platform/OS support from the other community

- flutter-tizen: https://github.com/flutter-tizen/plugins/tree/master/packages/flutter_webrtc
- flutter-elinux(WIP): https://github.com/sony/flutter-elinux-plugins/issues/7

## 🛠️ Setup

### 📱 iOS Setup

<details>
<summary><strong>🔧 Required Permissions</strong></summary>

Add the following entries to your `Info.plist` file, located in `<project root>/ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>$(PRODUCT_NAME) Camera Usage!</string>
<key>NSMicrophoneUsageDescription</key>
<string>$(PRODUCT_NAME) Microphone Usage!</string>
```

This allows your app to access camera and microphone.

</details>

<details>
<summary><strong>⚠️ Important iOS Configuration</strong></summary>

The WebRTC.xframework compiled after the m104 release no longer supports iOS arm devices. Add this to your `ios/Podfile`:

```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    target.build_configurations.each do |config|
      # Workaround for https://github.com/flutter/flutter/issues/64502
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES' # <= this line
    end
  end
end
```

</details>

### 🤖 Android Setup

<details>
<summary><strong>🔧 Required Permissions</strong></summary>

Add these permissions to your `AndroidManifest.xml` file:

```xml
<uses-feature android:name="android.hardware.camera" />
<uses-feature android:name="android.hardware.camera.autofocus" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
```

</details>

<details>
<summary><strong>🎧 Bluetooth Support (Optional)</strong></summary>

For Bluetooth device support, add these permissions:

```xml
<uses-permission android:name="android.permission.BLUETOOTH" android:maxSdkVersion="30" />
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" android:maxSdkVersion="30" />
```

</details>

<details>
<summary><strong>⚙️ Java 8 Configuration</strong></summary>

Add this to your app-level `build.gradle`:

```gradle
android {
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
}
```

</details>

## 🔧 Usage

### 🚀 Quick Start

<details>
<summary><strong>📡 Basic WebRTC Setup</strong></summary>

```dart
import 'package:flutter_webrtc_fixed_v0_12_0/flutter_webrtc_fixed_v0_12_0.dart';

// Create RTCPeerConnection
final configuration = {
  'iceServers': [
    {'urls': 'stun:stun.l.google.com:19302'},
  ]
};

RTCPeerConnection pc = await createPeerConnection(configuration);

// Add local stream
MediaStream localStream = await navigator.mediaDevices.getUserMedia({
  'audio': true,
  'video': true
});

localStream.getTracks().forEach((track) {
  pc.addTrack(track, localStream);
});
```

</details>

<details>
<summary><strong>📱 Complete Example App</strong></summary>

Check out the [complete example app](example/) that demonstrates:
- Video capture and rendering
- Peer connection management
- Audio/video controls
- Cross-platform compatibility

To run the example:
```bash
cd example
flutter pub get
flutter run
```

</details>

<details>
<summary><strong>🎥 Video Rendering</strong></summary>

```dart
RTCVideoRenderer localRenderer = RTCVideoRenderer();
RTCVideoRenderer remoteRenderer = RTCVideoRenderer();

@override
void initState() {
  super.initState();
  localRenderer.initialize();
  remoteRenderer.initialize();
}

@override
void dispose() {
  localRenderer.dispose();
  remoteRenderer.dispose();
  super.dispose();
}

// Set video stream
localRenderer.srcObject = localStream;
remoteRenderer.srcObject = remoteStream;
```

</details>

## 🌐 Web & WASM Support

<details>
<summary><strong>⚡ WASM Compatibility</strong></summary>

This package includes WASM-compatible implementations for better web performance:

- **Modern Web Standards**: Uses latest web APIs
- **Better Performance**: WASM provides faster execution
- **Future-Proof**: Ready for upcoming web technologies
- **Automatic Fallback**: Gracefully falls back to standard web implementation

</details>

<details>
<summary><strong>📦 Swift Package Manager Support</strong></summary>

Native iOS/macOS support via Swift Package Manager:

```swift
// Add to your Package.swift
dependencies: [
    .package(url: "https://github.com/boughdiri-dorsaf/flutter_webrtc_fixed_v0.12.0.git", from: "0.12.0")
]
```

**Benefits:**
- **Native Integration**: Direct Swift/Objective-C integration
- **Better Performance**: Optimized for iOS/macOS
- **Modern Tooling**: Works with Xcode's modern build system
- **Dependency Management**: Clean dependency resolution

</details>

## 📋 API Reference

### 🏗️ Core Classes

| Class | Description |
|:---|:---|
| `RTCPeerConnection` | WebRTC peer connection management |
| `MediaStream` | Audio/video stream handling |
| `RTCVideoRenderer` | Video rendering widget |
| `RTCDataChannel` | Data channel for messaging |

### 🔧 Key Methods

| Method | Description |
|:---|:---|
| `createPeerConnection(configuration)` | Create peer connection |
| `getUserMedia(constraints)` | Get media stream |
| `addTrack(track, stream)` | Add media track |
| `createOffer()` / `createAnswer()` | Create SDP offer/answer |
| `setLocalDescription(description)` | Set local SDP |
| `setRemoteDescription(description)` | Set remote SDP |

## 🚨 Troubleshooting

### 🔍 Common Issues

<details>
<summary><strong>📷 Camera Permission Issues</strong></summary>

- Ensure camera permissions are properly set in platform-specific files
- Check `Info.plist` (iOS) and `AndroidManifest.xml` (Android)
- Verify runtime permission requests

</details>

<details>
<summary><strong>🎤 Audio Issues</strong></summary>

- Check microphone permissions and audio settings
- Verify audio device selection
- Test with different audio configurations

</details>

<details>
<summary><strong>🌐 Network Issues</strong></summary>

- Verify STUN/TURN server configuration
- Check firewall and NAT settings
- Test with different network conditions

</details>

<details>
<summary><strong>🍎 iOS Build Issues</strong></summary>

- Ensure `ONLY_ACTIVE_ARCH` is set to 'YES' in Podfile
- Check Xcode version compatibility
- Verify iOS deployment target

</details>

### 🐛 Debug Information

```dart
// Check peer connection state
pc.onConnectionState = (RTCPeerConnectionState state) {
  print('Connection state: $state');
};

// Check ICE connection state
pc.onIceConnectionState = (RTCIceConnectionState state) {
  print('ICE connection state: $state');
};
```

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. 🍴 **Fork** the repository
2. 🌿 **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. ✏️ **Make** your changes
4. 🧪 **Test** thoroughly
5. 📤 **Submit** a pull request

### 📋 Contribution Guidelines

- Follow the existing code style
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 📞 Support

### 🆘 Need Help?

- 🐛 **Report Issues**: [GitHub Issues](https://github.com/boughdiri-dorsaf/flutter_webrtc_fixed_v0.12.0/issues)
- 📖 **Documentation**: Check the troubleshooting section above
- 🔍 **API Reference**: Review the comprehensive API documentation
- 💡 **This is a fixed version** of the original flutter_webrtc package

### 🌟 Show Your Support

If this package helped you, please give it a ⭐ on GitHub!

## 🔄 Updates

This package is maintained and updated regularly. Check the [CHANGELOG.md](CHANGELOG.md) for version history and updates.

---

<div align="center">

**🎯 Ready to build amazing real-time communication apps?**

[![Get Started](https://img.shields.io/badge/Get%20Started-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://pub.dartlang.org/packages/flutter_webrtc_fixed_v0_12_0)
[![View on GitHub](https://img.shields.io/badge/View%20on%20GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/boughdiri-dorsaf/flutter_webrtc_fixed_v0.12.0)

*This version is optimized for production use and includes all necessary fixes and improvements.*

</div>
