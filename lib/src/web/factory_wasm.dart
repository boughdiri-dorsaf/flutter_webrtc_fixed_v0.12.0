import '../desktop_capturer.dart';

export 'package:dart_webrtc/dart_webrtc.dart'
    hide videoRenderer, MediaDevices, MediaRecorder;

// WASM-compatible factory implementation
DesktopCapturer get desktopCapturer => throw UnimplementedError();

// Export WASM-compatible implementations
export 'rtc_video_renderer_wasm.dart';
export 'rtc_video_view_wasm.dart';
