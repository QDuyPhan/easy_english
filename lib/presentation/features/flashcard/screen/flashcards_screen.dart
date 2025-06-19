import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/svg_button.dart';
import '../../../../domain/entities/word_entity.dart';

class FlashcardsScreen extends StatefulWidget {
  final List<WordEntity> words;

  const FlashcardsScreen({super.key, required this.words});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  int _curIndexNum = 0;
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _goToPreviousCard() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextCard() {
    if (_currentIndex < widget.words.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    final List<String> word = widget.words.map((e) => e.word).toList();
    final List<String> phoneticText =
        widget.words.map((e) => e.phoneticText).toList();
    int _curIndexNum = 0;
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: 'FLASHCARDS',
            leading: [
              SvgButton(
                svg: Assets.svgArrowLeft,
                onPressed: () => context.pop(),
              ),
            ],
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.words.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return FlipCard(
                  front: _buildFrontCard(widget.words[index]),
                  back: _buildBackCard(widget.words[index]),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _goToPreviousCard,
                icon: const Icon(Icons.arrow_back),
                label: const Text("Trước"),
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: _goToNextCard,
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Sau"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFrontCard(WordEntity word) {
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
                  word.word,
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  word.phoneticText,
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

  Widget _buildBackCard(WordEntity word) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final hasSense = word.senses.isNotEmpty;
    final hasExample = hasSense && word.senses.first.examples.isNotEmpty;

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
                  hasSense ? word.senses.first.definition : 'No definition',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Example',
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                    color: colorScheme.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  hasExample
                      ? word.senses.first.examples.first.x
                      : 'No example',
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
      // await _player.setUrl(widget.sound);
      // await _player.play();
    } catch (e) {
      app_config.printLog('e', 'Error play sound: $e');
    }
  }

  void showNextCard() {
    setState(() {
      _curIndexNum =
          (_curIndexNum + 1 < widget.words.length) ? _curIndexNum + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _curIndexNum =
          (_curIndexNum - 1 >= 0) ? _curIndexNum - 1 : widget.words.length - 1;
    });
  }
}
