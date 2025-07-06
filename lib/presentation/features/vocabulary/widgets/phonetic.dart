import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/theme/app_color.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Phonetic extends StatefulWidget {
  final String phonetic;
  final String phoneticText;
  final String? flag;
  final Color backgroundColor;

  const Phonetic({
    super.key,
    this.phonetic = '',
    this.phoneticText = '',
    required this.backgroundColor,
    this.flag,
  });

  @override
  State<Phonetic> createState() => _PhoneticState();
}

class _PhoneticState extends State<Phonetic> {
  // final AudioPlayer _player = di.getIt<AudioPlayer>();
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  Future<void> _playSound() async {
    if (widget.phonetic.isEmpty) return;
    try {
      app_config.printLog('i', '🔊 Try to play: ${widget.phonetic}');
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(widget.phonetic),
          headers: {
            'User-Agent':
                'Mozilla/5.0 (Android 10; Mobile; rv:89.0) Gecko/89.0 Firefox/89.0',
          },
        ),
      );
      await _player.play();
      app_config.printLog('i', '✅ Đã phát xong');
    } catch (e) {
      app_config.printLog('e', '❌ Lỗi phát âm thanh: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.flag ?? ''),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            (widget.phonetic.isNotEmpty && widget.phoneticText.isNotEmpty)
                ? SvgButton(
                  svg: Assets.svgVolume,
                  size: 16,
                  color: AppColor.black0,
                  backgroundColor: widget.backgroundColor,
                  onPressed: _playSound,
                )
                : SizedBox.shrink(),
            SizedBox(width: 8),
            Text(
              widget.phoneticText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
