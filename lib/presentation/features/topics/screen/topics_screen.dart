import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/presentation/features/topics/blocs/topics_event.dart';
import 'package:easy_english/presentation/features/topics/blocs/topics_state.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../vocabulary/widgets/word_card.dart' show WordCard;
import '../blocs/topics_bloc.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider.value(
      value:
          di.getIt<TopicsBloc>()
            ..add(const GetTopic(folder: 'animals', topic: 'animals')),
      child: Scaffold(
        body: BlocBuilder<TopicsBloc, TopicsState>(
          builder: (context, state) {
            // if (state is VocabularyInitial) {
            //   return const Center(child: CircularProgressIndicator());
            // } else if (state is VocabularyLoading) {
            //   return const Center(child: CircularProgressIndicator());
            // } else if (state is VocabularyError) {
            //   return Center(child: Text(state.message));
            // }
            if (state is TopicsLoaded) {
              return SafeArea(
                child: Column(
                  children: [
                    CustomAppbar(
                      title: 'Vocabulary',
                      actions: [
                        SvgButton(
                          svg: _showSearch ? Assets.svgClose : Assets.svgSearch,
                          // onPressed: _isOpenSearch,
                        ),
                      ],
                    ),
                    SearchBox(isSearch: _showSearch),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.words.length,
                        itemBuilder: (context, index) {
                          final word = state.words[index];
                          return WordCard(word: word);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
