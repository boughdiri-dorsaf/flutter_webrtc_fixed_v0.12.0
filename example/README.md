# Flutter WebRTC Fixed Example

This example demonstrates how to use the `flutter_webrtc_fixed_v0_12_0` package to create a real-time video communication app.

## Features Demonstrated

- 🎥 **Video Capture**: Access device camera and microphone
- 🔗 **Peer Connection**: Create WebRTC peer connections
- 📡 **Media Streaming**: Send and receive audio/video streams
- 🎛️ **Controls**: Mute/unmute audio, enable/disable video
- 📱 **Cross-Platform**: Works on iOS, Android, Web, macOS, Windows, and Linux

## Getting Started

1. **Install Dependencies**:
   ```bash
   cd example
   flutter pub get
   ```

2. **Run the Example**:
   ```bash
   flutter run
   ```

## Usage

1. **Create Connection**: Tap "Create Connection" to initialize the peer connection
2. **Start Camera**: Tap "Start Camera" to access your device's camera and microphone
3. **Create Offer/Answer**: Use these buttons to simulate the WebRTC signaling process
4. **Control Media**: Use the mute and video toggle buttons to control your media streams

## Platform Setup

### Android
The example includes the necessary permissions in `android/app/src/main/AndroidManifest.xml`:
- Camera permission
- Microphone permission
- Network access

### iOS
The example includes the necessary usage descriptions in `ios/Runner/Info.plist`:
- Camera usage description
- Microphone usage description

## Code Structure

- `main.dart`: Main application with WebRTC functionality
- `pubspec.yaml`: Dependencies and project configuration
- Platform-specific files for Android and iOS

## WebRTC Concepts Demonstrated

- **MediaStream**: Capturing audio and video from device
- **RTCPeerConnection**: Managing peer-to-peer connections
- **RTCVideoRenderer**: Displaying video streams
- **SDP (Session Description Protocol)**: Negotiating media capabilities
- **ICE (Interactive Connectivity Establishment)**: Finding network paths

## Troubleshooting

- Ensure camera and microphone permissions are granted
- Check that your device has a working camera and microphone
- For testing, you can run the app on two different devices or use a WebRTC testing service

## Learn More

- [WebRTC Documentation](https://webrtc.org/)
- [Flutter WebRTC Fixed Package](https://pub.dev/packages/flutter_webrtc_fixed_v0_12_0)
- [Flutter Documentation](https://flutter.dev/docs)
