import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CustomFlashcards extends StatefulWidget {
  final List<String> front;
  final List<String> back;
  final String sound;

  const CustomFlashcards({
    super.key,
    required this.front,
    required this.back,
    required this.sound,
  });

  @override
  State<CustomFlashcards> createState() => _CustomFlashcardsState();
}

class _CustomFlashcardsState extends State<CustomFlashcards> {
  final _player = di.getIt<AudioPlayer>();

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: currentWidth,
      height: currentHeight * 1,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: _buildFrontCard(widget.front, context),
        back: _buildBackCard(widget.back, context),
      ),
    );
  }

  Widget _buildFrontCard(List<String> text, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        elevation: 17,
        color: colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text[0],
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  text[1],
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimary,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

                SvgButton(
                  svg: Assets.svgVolume,
                  size: 35,
                  onPressed: _playSound,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackCard(List<String> text, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        elevation: 17,
        color: colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text[0],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Example',
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                    color: colorScheme.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  text[1],
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                    color: colorScheme.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _playSound() async {
    try {
      await _player.setUrl(widget.sound);
      await _player.play();
    } catch (e) {
      app_config.printLog('e', 'Error play sound: $e');
    }
  }
}
