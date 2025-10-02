import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Phonetic extends StatefulWidget {
  final String phonetic;
  final String phoneticText;
  final Color backgroundColor;

  const Phonetic({
    super.key,
    this.phonetic = '',
    this.phoneticText = '',
    required this.backgroundColor,
  });

  @override
  State<Phonetic> createState() => _PhoneticState();
}

class _PhoneticState extends State<Phonetic> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  // Future<void> _playSound() async {
  //   if (widget.phonetic.isEmpty) return;
  //   try {
  //     await _player.setAudioSource(
  //       AudioSource.uri(
  //         Uri.parse(widget.phonetic),
  //         headers: {
  //           'User-Agent': 'Mozilla/5.0',
  //         },
  //       ),
  //     );
  //     await _player.play();
  //   } catch (e) {
  //     debugPrint('❌ Error playing sound: $e');
  //   }
  // }

  void _playSound() async {
    try {
      // app_config.printLog('i', 'play sound: ${widget.phonetic}');
      // await _player.setUrl(widget.phonetic);
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(widget.phonetic),
          headers: {
            HttpHeaders.userAgentHeader:
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                'AppleWebKit/537.36 (KHTML, like Gecko) '
                'Chrome/58.0.3029.110 Safari/537.3',
          },
        ),
      );
      await _player.play();
    } catch (e) {
      debugPrint('skip');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final hasAudio =
        widget.phonetic.isNotEmpty && widget.phoneticText.isNotEmpty;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasAudio)
          InkWell(
            onTap: _playSound,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                FluentIcons.speaker_2_16_filled,
                color: colorScheme.onPrimary,
                size: 20,
              ),
            ),
          ),
        if (hasAudio) const SizedBox(width: 8),
        Text(
          widget.phoneticText,
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
        ),
      ],
    );
  }
}
