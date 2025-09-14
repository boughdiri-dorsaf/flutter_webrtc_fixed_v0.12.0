import '../desktop_capturer.dart';

export 'package:dart_webrtc/dart_webrtc.dart'
    hide videoRenderer, MediaDevices, MediaRecorder;

// WASM-compatible factory implementation
DesktopCapturer get desktopCapturer => throw UnimplementedError();
