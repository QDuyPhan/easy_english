import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/route_paths.dart';
import '../../../../core/utils/assets.dart';
import '../bloc/daily_words_bloc.dart';

class DailyWordsSection extends StatelessWidget {
  const DailyWordsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconSize = MediaQuery.sizeOf(context).width * 0.09;

    return BlocBuilder<DailyWordsBloc, DailyWordsState>(
      builder: (context, state) {
        if (state is DailyWordsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DailyWordsLoaded) {
          return Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.pngCalander,
                        height: iconSize,
                        width: iconSize,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Hôm nay học gì?',
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Wrap(
                    spacing: 8,
                    children:
                        state.words
                            .map(
                              (word) => GestureDetector(
                                onTap:
                                    () => context.push(
                                      RoutePaths.wordDetails,
                                      extra: {'word': word},
                                    ),
                                child: Chip(label: Text(word.word ?? '')),
                              ),
                            )
                            .toList(),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          );
        } else if (state is DailyWordsError) {
          return Center(child: Text('Lỗi: ${state.message}'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
