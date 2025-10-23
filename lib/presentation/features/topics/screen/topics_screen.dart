import 'package:easy_english/presentation/features/dictionary/bloc/dictionary_bloc.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/word_card.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/app_route_paths.dart';
import '../../../../core/utils/widgets/app_text_field.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import '../../../../domain/entities/word_entity.dart';
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
  String _searchText = '';
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    context.read<DictionaryBloc>().add(
      DictionaryEvent.getWords(folder: widget.folder, topic: widget.topic),
    );
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearch(String text) {
    setState(() {
      _searchText = text;
    });
  }

  List<WordEntity> _searchWords(List<WordEntity> words) {
    if (_searchText.isEmpty) {
      return words;
    }
    return words.where((word) {
      return word.word.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: BlocBuilder<DictionaryBloc, DictionaryState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomAppBar(
              title: widget.topic.replaceAll('_', ' ').toUpperCase(),
              leading: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(FluentIcons.chevron_left_12_regular),
                ),
              ],
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _showSearch = !_showSearch;
                    });
                  },
                  icon: Icon(FluentIcons.search_12_regular),
                ),
              ],
              child: Column(
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child:
                        _showSearch
                            ? AppTextField(
                              controller: _searchController,
                              hint: 'Search words...',
                              prefixIcon: const Icon(Icons.search_rounded),
                              suffixIcon:
                                  _searchController.text.isNotEmpty
                                      ? IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          _searchController.clear();
                                          _onSearch('');
                                        },
                                        icon: const Icon(Icons.clear_rounded),
                                      )
                                      : null,
                              focusNode: _focusNode,
                              onChanged: (value) {
                                _onSearch(value);
                              },
                              onSubmitted: (value) {
                                _onSearch(value);
                                _focusNode.unfocus();
                              },
                            )
                            : const SizedBox(width: double.infinity),
                  ),
                  Expanded(child: _buildWordListTab(context, state)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWordListTab(BuildContext context, DictionaryState state) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    List<WordEntity> words = _searchWords(state.words);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.words.isEmpty) {
      return Center(
        child: Text(
          'No words available',
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: words.length,
      itemBuilder: (context, index) {
        final word = words[index];
        return WordCard(word: word);
      },
    );
  }
}
