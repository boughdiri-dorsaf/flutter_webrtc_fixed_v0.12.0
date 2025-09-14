import 'dart:async';
import 'dart:ui_web' as web_ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:dart_webrtc/dart_webrtc.dart';
import 'package:web/web.dart' as web;

// WASM-compatible video renderer implementation
class RTCVideoRenderer extends ValueNotifier<RTCVideoValue>
    implements VideoRenderer {
  RTCVideoRenderer()
      : _textureId = _textureCounter++,
        super(RTCVideoValue.empty);

  static int _textureCounter = 1;
  final int _textureId;
  web.MediaStream? _srcObject;
  bool _isInitialized = false;
  bool _isDisposed = false;

  @override
  int get textureId => _textureId;

  @override
  web.MediaStream? get srcObject => _srcObject;

  @override
  set srcObject(web.MediaStream? stream) {
    if (_isDisposed) return;

    _srcObject = stream;
    if (_isInitialized) {
      _updateValue();
    }
  }

  @override
  Future<void> initialize() async {
    if (_isInitialized || _isDisposed) return;

    try {
      _isInitialized = true;
      _updateValue();
    } catch (e) {
      _isInitialized = false;
      rethrow;
    }
  }

  @override
  Future<void> dispose() async {
    if (_isDisposed) return;

    _isDisposed = true;
    _srcObject = null;
    value = RTCVideoValue.empty;
  }

  void _updateValue() {
    if (_isDisposed) return;

    final hasVideo = _srcObject?.getVideoTracks().isNotEmpty ?? false;
    final hasAudio = _srcObject?.getAudioTracks().isNotEmpty ?? false;

    value = RTCVideoValue(
      width: 0,
      height: 0,
      rotation: 0,
      hasVideo: hasVideo,
      hasAudio: hasAudio,
    );
  }

  @override
  Future<void> setMicrophoneMute(bool mute) async {
    if (_srcObject == null || _isDisposed) return;

    final audioTracks = _srcObject!.getAudioTracks();
    for (final track in audioTracks) {
      track.enabled = !mute;
    }
  }

  @override
  Future<void> setSpeakerphoneOn(bool on) async {
    // Web doesn't support speakerphone control
    // This is a no-op for web platform
  }

  @override
  Future<void> setVolume(double volume) async {
    // Web volume control is handled by the browser
    // This is a no-op for web platform
  }
}
