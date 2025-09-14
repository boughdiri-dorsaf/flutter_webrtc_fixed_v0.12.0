# flutter_webrtc_fixed_v0_12_0_example

A comprehensive example app demonstrating the Flutter WebRTC Fixed v0.12.0 plugin.

## Features

- **Video Capture**: Local video capture and rendering
- **Peer Connection**: WebRTC peer connection management
- **Audio/Video Controls**: Start call and hang up functionality
- **Cross-Platform**: Works on iOS, Android, and Web
- **Modern UI**: Material Design 3 interface

## Getting Started

### Prerequisites

- Flutter SDK (>=1.22.0)
- Dart SDK (>=3.3.0)
- Android Studio / Xcode (for mobile development)
- Chrome (for web development)

### Running the Example

1. **Get dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run on your preferred platform:**
   ```bash
   # Android
   flutter run -d android
   
   # iOS
   flutter run -d ios
   
   # Web
   flutter run -d chrome
   ```

### Permissions

The app requires the following permissions:

**Android:**
- Camera
- Microphone
- Internet
- Network State

**iOS:**
- Camera Usage
- Microphone Usage

## Usage

1. **Start Call**: Tap the "Start Call" button to begin video capture
2. **Grant Permissions**: Allow camera and microphone access when prompted
3. **View Local Video**: Your camera feed will appear in the left panel
4. **Hang Up**: Tap "Hang Up" to end the call and stop video capture

## Architecture

The example demonstrates:

- **RTCVideoRenderer**: For video rendering
- **RTCPeerConnection**: For peer-to-peer connections
- **MediaStream**: For audio/video streams
- **Navigator.mediaDevices**: For device access

## Notes

- This is a local demo - for real peer-to-peer calls, you would need signaling
- The app shows local video capture and rendering capabilities
- WebRTC functionality works across all supported platforms

## Troubleshooting

- Ensure you have granted camera and microphone permissions
- For Android, make sure you're using a physical device or emulator with camera support
- For iOS, ensure you're using a physical device (simulator doesn't support camera)
