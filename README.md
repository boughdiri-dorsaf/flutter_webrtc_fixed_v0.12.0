# Flutter WebRTC Fixed v0.12.0

[![pub package](https://img.shields.io/pub/v/flutter_webrtc_fixed_v0.12.0.svg)](https://pub.dartlang.org/packages/flutter_webrtc_fixed_v0.12.0) [![GitHub](https://img.shields.io/github/stars/boughdiri-dorsaf/flutter_webrtc_fixed_v0.12.0?style=social)](https://github.com/boughdiri-dorsaf/flutter_webrtc_fixed_v0.12.0)

WebRTC plugin for Flutter Mobile/Desktop/Web. This is a fixed and improved version of the original flutter_webrtc package with additional bug fixes and optimizations for production use.

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

### From pub.dev (Recommended)
```yaml
dependencies:
  flutter_webrtc_fixed_v0.12.0: ^0.12.0
```

### From GitHub
```yaml
dependencies:
  flutter_webrtc_fixed_v0.12.0:
    git:
      url: https://github.com/boughdiri-dorsaf/flutter_webrtc_fixed_v0.12.0.git
      ref: main
```

### From Local Path
```yaml
dependencies:
  flutter_webrtc_fixed_v0.12.0:
    path: ./flutter_webrtc_fixed_v0.12.0
```

## 🚀 Features

| Feature | Android | iOS | [Web](https://flutter.dev/web) | macOS | Windows | Linux | [Embedded](https://github.com/sony/flutter-elinux) | [Fuchsia](https://fuchsia.dev/) |
| :-------------: | :-------------:| :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: |
| Audio/Video | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | |
| Data Channel | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | |
| Screen Capture | :heavy_check_mark: | [:heavy_check_mark:(*)](https://github.com/flutter-webrtc/flutter-webrtc/wiki/iOS-Screen-Sharing) | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | |
| Unified-Plan | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | |
| Simulcast | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | |
| MediaRecorder | :warning: | :warning: | :heavy_check_mark: | | | | | |
| End to End Encryption | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | |
| Insertable Streams | | | | | | | | |

Additional platform/OS support from the other community

- flutter-tizen: https://github.com/flutter-tizen/plugins/tree/master/packages/flutter_webrtc
- flutter-elinux(WIP): https://github.com/sony/flutter-elinux-plugins/issues/7

## 🛠️ Setup

### iOS Setup

Add the following entry to your `Info.plist` file, located in `<project root>/ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>$(PRODUCT_NAME) Camera Usage!</string>
<key>NSMicrophoneUsageDescription</key>
<string>$(PRODUCT_NAME) Microphone Usage!</string>
```

This entry allows your app to access camera and microphone.

#### Note for iOS
The WebRTC.xframework compiled after the m104 release no longer supports iOS arm devices, so need to add the `config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'` to your ios/Podfile in your project

ios/Podfile

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

### Android Setup

Ensure the following permission is present in your Android Manifest file, located in `<project root>/android/app/src/main/AndroidManifest.xml`:

```xml
<uses-feature android:name="android.hardware.camera" />
<uses-feature android:name="android.hardware.camera.autofocus" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
```

If you need to use a Bluetooth device, please add:

```xml
<uses-permission android:name="android.permission.BLUETOOTH" android:maxSdkVersion="30" />
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" android:maxSdkVersion="30" />
```

The Flutter project template adds it, so it may already be there.

Also you will need to set your build settings to Java 8, because official WebRTC jar now uses static methods in `EglBase` interface. Just add this to your app level `build.gradle`:

```gradle
android {
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
}
```

## 🔧 Usage

### Basic WebRTC Setup
```dart
import 'package:flutter_webrtc_fixed_v0.12.0/flutter_webrtc.dart';

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

### Video Rendering
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

## 📋 API Reference

### Core Classes
- `RTCPeerConnection` - WebRTC peer connection
- `MediaStream` - Audio/video stream
- `RTCVideoRenderer` - Video rendering widget
- `RTCDataChannel` - Data channel for messaging

### Key Methods
- `createPeerConnection(configuration)` - Create peer connection
- `getUserMedia(constraints)` - Get media stream
- `addTrack(track, stream)` - Add media track
- `createOffer()` / `createAnswer()` - Create SDP offer/answer
- `setLocalDescription(description)` - Set local SDP
- `setRemoteDescription(description)` - Set remote SDP

## 🚨 Troubleshooting

### Common Issues
1. **Camera Permission**: Ensure camera permissions are properly set
2. **Audio Issues**: Check microphone permissions and audio settings
3. **Network Issues**: Verify STUN/TURN server configuration
4. **iOS Build Issues**: Ensure `ONLY_ACTIVE_ARCH` is set to 'YES'

### Debug Information
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

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

For support and questions:
- Create an issue in the [GitHub repository](https://github.com/boughdiri-dorsaf/flutter_webrtc_fixed_v0.12.0/issues)
- Check the troubleshooting section above
- Review the API documentation
- This is a fixed version of the original flutter_webrtc package

## 🔄 Updates

This package is maintained and updated regularly. Check the CHANGELOG.md for version history and updates.

---

**Note**: This version is optimized for production use and includes all necessary fixes and improvements.
