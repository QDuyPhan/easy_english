import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/word_entity.dart';

class FlashcardsScreen extends StatefulWidget {
  final List<WordEntity> words;

  const FlashcardsScreen({super.key, required this.words});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _goToPreviousCard() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextCard() {
    if (_currentIndex < widget.words.length - 1) {
      setState(() => _currentIndex++);
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

    return Scaffold(
      body:
          widget.words.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  CustomAppbar(
                    title: 'Flashcards',
                    leading: [
                      IconButton(
                        icon: const Icon(FluentIcons.chevron_left_12_regular),
                        onPressed: () => context.pop(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: widget.words.length,
                          onPageChanged:
                              (index) => setState(() => _currentIndex = index),
                          itemBuilder:
                              (context, index) => FlipCard(
                                front: _buildFrontCard(widget.words[index]),
                                back: _buildBackCard(widget.words[index]),
                              ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _goToPreviousCard,
                        icon: Icon(
                          FluentIcons.chevron_left_12_regular,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: _goToNextCard,
                        icon: Icon(
                          FluentIcons.chevron_right_12_regular,
                          color: colorScheme.onSurface,
                        ),
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

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              word.word,
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              word.phoneticText,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: _playSound,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  FluentIcons.speaker_2_16_regular,
                  size: 28,
                  color: colorScheme.primaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackCard(WordEntity word) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final hasSense = word.senses.isNotEmpty;
    final hasExample = hasSense && word.senses.first.examples.isNotEmpty;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              hasSense ? word.senses.first.definition : 'No definition',
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Text(
              'Example',
              style: textTheme.labelLarge?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              hasExample ? word.senses.first.examples.first.x : 'No example',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
              textAlign: TextAlign.center,
            ),
          ],
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
}
