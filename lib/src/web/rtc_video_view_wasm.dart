import 'package:flutter/widgets.dart';
import 'package:web/web.dart' as web;

import 'rtc_video_renderer_wasm.dart';

// WASM-compatible video view implementation
class RTCVideoView extends StatelessWidget {
  const RTCVideoView(
    this._renderer, {
    super.key,
    this.mirror = false,
    this.filterQuality = FilterQuality.low,
    this.objectFit = RTCVideoViewObjectFit.RTCVideoViewObjectFitContain,
    this.placeholderBuilder,
  });

  final RTCVideoRenderer _renderer;
  final bool mirror;
  final FilterQuality filterQuality;
  final RTCVideoViewObjectFit objectFit;
  final Widget Function(BuildContext context)? placeholderBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _buildVideoElement(constraints);
      },
    );
  }

  Widget _buildVideoElement(BoxConstraints constraints) {
    if (_renderer.srcObject == null) {
      return placeholderBuilder?.call(context) ?? const SizedBox.shrink();
    }

    return SizedBox(
      width: constraints.maxWidth,
      height: constraints.maxHeight,
      child: _WebRTCVideoElement(
        renderer: _renderer,
        mirror: mirror,
        filterQuality: filterQuality,
        objectFit: objectFit,
      ),
    );
  }
}

class _WebRTCVideoElement extends StatefulWidget {
  const _WebRTCVideoElement({
    required this.renderer,
    required this.mirror,
    required this.filterQuality,
    required this.objectFit,
  });

  final RTCVideoRenderer renderer;
  final bool mirror;
  final FilterQuality filterQuality;
  final RTCVideoViewObjectFit objectFit;

  @override
  State<_WebRTCVideoElement> createState() => _WebRTCVideoElementState();
}

class _WebRTCVideoElementState extends State<_WebRTCVideoElement> {
  web.HTMLVideoElement? _videoElement;

  @override
  void initState() {
    super.initState();
    _createVideoElement();
  }

  @override
  void didUpdateWidget(_WebRTCVideoElement oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.renderer != widget.renderer) {
      _updateVideoElement();
    }
  }

  @override
  void dispose() {
    _videoElement?.remove();
    super.dispose();
  }

  void _createVideoElement() {
    _videoElement = web.HTMLVideoElement()
      ..autoplay = true
      ..muted = true
      ..playsInline = true
      ..style.objectFit = _getObjectFit()
      ..style.transform = widget.mirror ? 'scaleX(-1)' : 'none';

    _updateVideoElement();
  }

  void _updateVideoElement() {
    if (_videoElement == null) return;

    _videoElement!.srcObject = widget.renderer.srcObject;
  }

  String _getObjectFit() {
    switch (widget.objectFit) {
      case RTCVideoViewObjectFit.RTCVideoViewObjectFitContain:
        return 'contain';
      case RTCVideoViewObjectFit.RTCVideoViewObjectFitCover:
        return 'cover';
      case RTCVideoViewObjectFit.RTCVideoViewObjectFitFill:
        return 'fill';
      case RTCVideoViewObjectFit.RTCVideoViewObjectFitScaleDown:
        return 'scale-down';
      case RTCVideoViewObjectFit.RTCVideoViewObjectFitNone:
        return 'none';
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // Placeholder for web implementation
  }
}

enum RTCVideoViewObjectFit {
  RTCVideoViewObjectFitContain,
  RTCVideoViewObjectFitCover,
  RTCVideoViewObjectFitFill,
  RTCVideoViewObjectFitScaleDown,
  RTCVideoViewObjectFitNone,
}
