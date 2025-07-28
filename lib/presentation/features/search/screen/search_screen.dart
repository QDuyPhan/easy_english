import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/widgets/app_text_field.dart';
import '../../../../domain/entities/word_entity.dart';
import '../blocs/search_bloc.dart';
import '../widgets/search_result_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Debouncer _debouncer = Debouncer();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _searchController,
                      hint: 'Search words...',
                      prefixIcon: const Icon(Icons.search_rounded),
                      onChanged: (value) {
                        if (value.trim().isEmpty) {
                          context.read<SearchBloc>().add(
                            const SearchEvent.clearSearch(),
                          );
                          return;
                        }

                        _debouncer.debounce(
                          duration: const Duration(milliseconds: 300),
                          onDebounce: () {
                            context.read<SearchBloc>().add(
                              SearchEvent.searchWords(query: value),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      _searchController.clear();
                      context.read<SearchBloc>().add(
                        const SearchEvent.clearSearch(),
                      );
                      context.pop();
                    },
                    child: Text(
                      'Cancel',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => _buildInitialState(textTheme, colorScheme),
                      loading: () => _buildLoadingState(textTheme, colorScheme),
                      success:
                          (results) => _buildSuccessState(context, results),
                      noResults:
                          () => _buildNoResultsState(textTheme, colorScheme),
                      error:
                          (message) =>
                              _buildErrorState(message, textTheme, colorScheme),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInitialState(TextTheme textTheme, ColorScheme colorScheme) {
    return _buildPlaceholder(
      icon: Icons.search_rounded,
      title: 'Search for words',
      subtitle:
          'Search in Oxford dictionary and topics\nTry typing a word to get started',
      textTheme: textTheme,
      colorScheme: colorScheme,
    );
  }

  Widget _buildNoResultsState(TextTheme textTheme, ColorScheme colorScheme) {
    return _buildPlaceholder(
      icon: Icons.search_off_rounded,
      title: 'No results found',
      subtitle:
          'Try searching with different keywords or check your spelling.\nYou can also try searching for part of a word.',
      textTheme: textTheme,
      colorScheme: colorScheme,
    );
  }

  Widget _buildLoadingState(TextTheme textTheme, ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 16),
          Text(
            'Searching...',
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
    String message,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return _buildPlaceholder(
      icon: Icons.error_outline_rounded,
      title: 'Search error',
      subtitle: 'Something went wrong while searching.\nPlease try again.',
      iconColor: colorScheme.error,
      titleColor: colorScheme.error,
      textTheme: textTheme,
      colorScheme: colorScheme,
    );
  }

  Widget _buildPlaceholder({
    required IconData icon,
    required String title,
    required String subtitle,
    required TextTheme textTheme,
    required ColorScheme colorScheme,
    Color? iconColor,
    Color? titleColor,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: iconColor ?? colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: textTheme.headlineSmall?.copyWith(
              color: titleColor ?? colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context, List<WordEntity> results) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            children: [
              Icon(Icons.search_rounded, size: 20, color: colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                'Found ${results.length} result${results.length > 1 ? 's' : ''}',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 12),
            itemCount: results.length,
            itemBuilder: (context, index) {
              return SearchResultItem(word: results[index]);
            },
          ),
        ),
      ],
    );
  }
}
