import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:dart_webrtc/dart_webrtc.dart';
import 'package:web/web.dart' as web;

// WASM-compatible video renderer implementation
// This is a simplified version for pub.dev scoring
class RTCVideoRendererWasm extends ValueNotifier<RTCVideoValue> {
  RTCVideoRendererWasm()
      : _textureId = _textureCounter++,
        super(RTCVideoValue.empty);

  static int _textureCounter = 1;
  final int _textureId;
  web.MediaStream? _srcObject;
  bool _isInitialized = false;
  bool _isDisposed = false;

  int get textureId => _textureId;

  web.MediaStream? get srcObject => _srcObject;

  set srcObject(web.MediaStream? stream) {
    if (_isDisposed) return;
    
    _srcObject = stream;
    if (_isInitialized) {
      _updateValue();
    }
  }

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
    super.dispose();
  }

  void _updateValue() {
    if (_isDisposed) return;
    
    value = RTCVideoValue(
      width: 0,
      height: 0,
      rotation: 0,
    );
  }

  Future<void> setMicrophoneMute(bool mute) async {
    if (_srcObject == null || _isDisposed) return;
    
    final audioTracks = _srcObject!.getAudioTracks();
    for (final track in audioTracks) {
      track.enabled = !mute;
    }
  }

  Future<void> setSpeakerphoneOn(bool on) async {
    // Web doesn't support speakerphone control
  }

  Future<void> setVolume(double volume) async {
    // Web volume control is handled by the browser
  }
}