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
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Header
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: _searchController,
                          hint: 'Search words...',
                          prefixIcon: const Icon(Icons.search_rounded),
                          onChanged: (value) {
                            const duration = Duration(milliseconds: 500);
                            _debouncer.debounce(
                              duration: duration,
                              onDebounce: () {
                                context.read<SearchBloc>().add(
                                  SearchEvent.searchWords(query: value),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _searchController.clear();
                          context.read<SearchBloc>().add(
                            const SearchEvent.clearSearch(),
                          );
                          context.pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search Results
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => _buildInitialState(textTheme, colorScheme),
                      loading: () => _buildLoadingState(),
                      success: (results) => _buildSuccessState(results),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_rounded,
            size: 64,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'Search for words',
            style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Search in Oxford dictionary and topics',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildSuccessState(List<WordEntity> results) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Found ${results.length} results',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return SearchResultItem(word: results[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNoResultsState(TextTheme textTheme, ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 64,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'No results found',
            style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline_rounded, size: 64, color: colorScheme.error),
          const SizedBox(height: 16),
          Text(
            'Error occurred',
            style: textTheme.headlineSmall?.copyWith(color: colorScheme.error),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
