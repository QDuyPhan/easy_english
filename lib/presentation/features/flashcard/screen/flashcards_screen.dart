import 'package:easy_english/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import '../../../../core/utils/widgets/svg_button.dart';
import '../../../../domain/entities/word_entity.dart';
import '../../topics/blocs/topics_bloc.dart';

class FlashcardsScreen extends StatefulWidget {
  final List<WordEntity> words;

  const FlashcardsScreen({super.key, required this.words});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  int _curIndexNum = 0;

  @override
  void initState() {
    super.initState();
    app_config.printLog('d', 'FlashcardsScreen: ${widget.words.first.word}');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: BlocBuilder<TopicsBloc, TopicsState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomAppbar(
              title: 'Flashcards',
              leading: [
                SvgButton(
                  svg: Assets.svgArrowLeft,
                  onPressed: () => context.pop(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
