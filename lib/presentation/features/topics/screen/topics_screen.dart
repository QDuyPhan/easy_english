import 'package:easy_english/core/utils/widgets/base_screen.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/search_box.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/route_paths.dart';
import '../../flashcard/widgets/flash_cards_button.dart';
import '../blocs/topics_bloc.dart';

class TopicsScreen extends StatefulWidget {
  final String folder;
  final String topic;

  const TopicsScreen({super.key, required this.folder, required this.topic});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  bool _showSearch = false;
  int _curIndexNum = 0;

  @override
  void initState() {
    super.initState();
    context.read<TopicsBloc>().add(
      TopicsEvent.getAllTopics(folder: widget.folder, topic: widget.topic),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicsBloc, TopicsState>(
      builder: (context, state) {
        return Scaffold(
          body: BaseScreen(
            title: widget.topic.replaceAll('_', ' ').toUpperCase(),
            showSearch: _showSearch,
            onSearchToggle: () {
              setState(() {
                _showSearch = !_showSearch;
              });
            },
            searchBox: _showSearch ? SearchBox(showSearch: _showSearch) : null,
            tabViews: [_buildWordListTab(context, state)],
          ),
          floatingActionButton: FlashCardsButton(
            onPressed:
                () => context.push(
                  RoutePaths.flashcards,
                  extra: {'word': state.words},
                ),
          ),
        );
      },
    );
  }

  Widget _buildWordListTab(BuildContext context, TopicsState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.words.length,
      itemBuilder: (context, index) {
        final word = state.words[index];
        return WordCard(word: word);
      },
    );
  }
}

// Widget _buildFlashcardTab(BuildContext context, TopicsState state) {
//   final colorScheme = Theme
//       .of(context)
//       .colorScheme;
//   final textTheme = Theme
//       .of(context)
//       .textTheme;
//
//
//
//     final currentWord = state.words[];
//     final totalWords = state.words.length;
//
//     final definition = currentWord.senses.first.definition;
//     final example = currentWord.senses.first.examples.first.x;
//     if (state.words.isEmpty) {
//       return Text('');
//     }
//     {
//       final definition = currentWord.senses.first.definition;
//       final example = currentWord.senses.first.examples.first.x;
//     }
//
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           '${_curIndexNum + 1}/$totalWords',
//           style: textTheme.titleMedium?.copyWith(
//             color: colorScheme.onSurfaceVariant,
//           ),
//         ),
//         const SizedBox(height: 16),
//         Expanded(
//           child: Center(
//             child: CustomFlashcards(
//               front: [currentWord.word, currentWord.phoneticText],
//               back: [definition.toString(), example.toString()],
//               sound: currentWord.phonetic,
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               onPressed:
//               _curIndexNum > 0
//                   ? () {
//                 setState(() {
//                   _curIndexNum =
//                   (_curIndexNum - 1 >= 0)
//                       ? _curIndexNum - 1
//                       : state.words.length - 1;
//                 });
//               }
//                   : null,
//               icon: const Icon(Icons.arrow_back),
//             ),
//             const SizedBox(width: 16),
//             IconButton(
//               onPressed:
//               _curIndexNum < totalWords - 1
//                   ? () {
//                 setState(() {
//                   _curIndexNum =
//                   (_curIndexNum - 1 >= 0)
//                       ? _curIndexNum - 1
//                       : state.words.length - 1;
//                 });
//               }
//                   : null,
//               icon: const Icon(Icons.arrow_forward),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
