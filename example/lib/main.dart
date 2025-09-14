import 'package:flutter/material.dart';
import 'package:flutter_webrtc_fixed_v0_12_0/flutter_webrtc_fixed_v0_12_0.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebRTC Fixed Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const WebRTCExample(),
    );
  }
}

class WebRTCExample extends StatefulWidget {
  const WebRTCExample({super.key});

  @override
  State<WebRTCExample> createState() => _WebRTCExampleState();
}

class _WebRTCExampleState extends State<WebRTCExample> {
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  bool _isConnected = false;
  bool _isMuted = false;
  bool _isVideoEnabled = true;
  String _connectionStatus = 'Disconnected';

  @override
  void initState() {
    super.initState();
    _initializeRenderers();
  }

  Future<void> _initializeRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    _peerConnection?.close();
    _localStream?.dispose();
    super.dispose();
  }

  Future<void> _createPeerConnection() async {
    final configuration = {
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
        {'urls': 'stun:stun1.l.google.com:19302'},
      ]
    };

    _peerConnection = await createPeerConnection(configuration);

    _peerConnection!.onIceCandidate = (RTCIceCandidate candidate) {
      print('ICE Candidate: ${candidate.candidate}');
    };

    _peerConnection!.onConnectionState = (RTCPeerConnectionState state) {
      setState(() {
        _connectionStatus = state.toString().split('.').last;
        _isConnected =
            state == RTCPeerConnectionState.RTCPeerConnectionStateConnected;
      });
    };

    _peerConnection!.onAddStream = (MediaStream stream) {
      print('Remote stream added');
      _remoteRenderer.srcObject = stream;
    };
  }

  Future<void> _getUserMedia() async {
    try {
      _localStream = await navigator.mediaDevices.getUserMedia({
        'audio': true,
        'video': {
          'mandatory': {
            'minWidth': '640',
            'minHeight': '480',
            'minFrameRate': '30',
          },
          'facingMode': 'user',
          'optional': [],
        }
      });

      _localRenderer.srcObject = _localStream;

      if (_peerConnection != null) {
        _localStream!.getTracks().forEach((track) {
          _peerConnection!.addTrack(track, _localStream!);
        });
      }
    } catch (e) {
      print('Error getting user media: $e');
    }
  }

  Future<void> _createOffer() async {
    if (_peerConnection == null) return;

    try {
      final offer = await _peerConnection!.createOffer();
      await _peerConnection!.setLocalDescription(offer);
      print('Offer created: ${offer.sdp}');
    } catch (e) {
      print('Error creating offer: $e');
    }
  }

  Future<void> _createAnswer() async {
    if (_peerConnection == null) return;

    try {
      final answer = await _peerConnection!.createAnswer();
      await _peerConnection!.setLocalDescription(answer);
      print('Answer created: ${answer.sdp}');
    } catch (e) {
      print('Error creating answer: $e');
    }
  }

  void _toggleMute() {
    if (_localStream != null) {
      final audioTrack = _localStream!.getAudioTracks().first;
      audioTrack.enabled = _isMuted;
      setState(() {
        _isMuted = !_isMuted;
      });
    }
  }

  void _toggleVideo() {
    if (_localStream != null) {
      final videoTrack = _localStream!.getVideoTracks().first;
      videoTrack.enabled = _isVideoEnabled;
      setState(() {
        _isVideoEnabled = !_isVideoEnabled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebRTC Fixed Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Connection Status
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status: $_connectionStatus'),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isConnected ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Video Renderers
            Expanded(
              child: Row(
                children: [
                  // Local Video
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Local Video',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            child: RTCVideoView(
                              _localRenderer,
                              mirror: true,
                              objectFit: RTCVideoViewObjectFit
                                  .RTCVideoViewObjectFitCover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Remote Video
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Remote Video',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            child: RTCVideoView(
                              _remoteRenderer,
                              objectFit: RTCVideoViewObjectFit
                                  .RTCVideoViewObjectFitCover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Control Buttons
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: _createPeerConnection,
                  icon: const Icon(Icons.link),
                  label: const Text('Create Connection'),
                ),
                ElevatedButton.icon(
                  onPressed: _getUserMedia,
                  icon: const Icon(Icons.videocam),
                  label: const Text('Start Camera'),
                ),
                ElevatedButton.icon(
                  onPressed: _createOffer,
                  icon: const Icon(Icons.call_made),
                  label: const Text('Create Offer'),
                ),
                ElevatedButton.icon(
                  onPressed: _createAnswer,
                  icon: const Icon(Icons.call_received),
                  label: const Text('Create Answer'),
                ),
                ElevatedButton.icon(
                  onPressed: _toggleMute,
                  icon: Icon(_isMuted ? Icons.mic_off : Icons.mic),
                  label: Text(_isMuted ? 'Unmute' : 'Mute'),
                ),
                ElevatedButton.icon(
                  onPressed: _toggleVideo,
                  icon: Icon(
                      _isVideoEnabled ? Icons.videocam_off : Icons.videocam),
                  label:
                      Text(_isVideoEnabled ? 'Disable Video' : 'Enable Video'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
