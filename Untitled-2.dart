// lib/widgets/media_player.dart

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MediaPlayer extends StatefulWidget {
  final String audioUrl;
  final String title;

  MediaPlayer({required this.audioUrl, required this.title});

  @override
  _MediaPlayerState createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(widget.audioUrl);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Now Playing: ${widget.title}', style: TextStyle(fontSize: 16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: _playPause,
            ),
          ],
        ),
      ],
    );
  }
}
