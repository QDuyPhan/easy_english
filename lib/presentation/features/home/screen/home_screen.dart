import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/presentation/features/home/bloc/daily_words_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DailyWordsBloc>().add(const GetDailyWordsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final iconSize = size.width * 0.09;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Image.asset(
                  Assets.pngLogo,
                  height: size.height * 0.05,
                  width: size.width * 0.06,
                ),
                Expanded(
                  child: CustomAppbar(
                    titleAlign: TextAlign.left,
                    title: 'Easy English',
                    actions: [
                      IconButton(
                        onPressed: _openSearch,
                        icon: const Icon(FluentIcons.search_12_regular),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                BlocBuilder<DailyWordsBloc, DailyWordsState>(
                  builder: (context, state) {
                    if (state is DailyWordsLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is DailyWordsLoaded) {
                      return Container(
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: colorScheme.outline.withOpacity(0.3),
                            width: 1.2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
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
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Wrap(
                                spacing: 8,
                                children:
                                    state.words
                                        .map(
                                          (word) => GestureDetector(
                                            child: Chip(label: Text(word.word)),
                                            onTap:
                                                () => context.push(
                                                  RoutePaths.wordDetails,
                                                  extra: {'word': word},
                                                ),
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is DailyWordsError) {
                      return Center(child: Text('Lỗi: ${state.message}'));
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openSearch() {
    context.push(RoutePaths.search);
  }

  Widget _buildDiscoverCard({
    required String title,
    required String image,
    VoidCallback? onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withOpacity(0.3),
            width: 1.2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  height: screenHeight * 0.15,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
