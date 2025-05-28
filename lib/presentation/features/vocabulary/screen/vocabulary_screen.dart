import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_bloc.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_event.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_state.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider.value(
      value: di.getIt<VocabularyBloc>()..add(const GetAllOxfordWords()),
      child: Scaffold(
        body: BlocBuilder<VocabularyBloc, VocabularyState>(
          builder: (context, state) {
            if (state is VocabularyInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VocabularyLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VocabularyError) {
              return Center(child: Text(state.message));
            }
            if (state is VocabularyLoaded) {
              return SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: screenHeight * 0.15,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Vocabulary",
                            style: TextStyle(
                              color: AppColor.black0,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
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
            return const Center(child: Text('Press button to load words'));
          },
        ),
        // floatingActionButton: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: () {
        //         context.read<VocabularyBloc>().add(const GetAllOxfordWords());
        //       },
        //       child: const Icon(Icons.refresh),
        //       heroTag: 'refresh',
        //     ),
        //     const SizedBox(height: 10),
        //     FloatingActionButton(
        //       onPressed: () {
        //         // context.read<VocabularyBloc>().add(const AddWordRandomly());
        //       },
        //       child: const Icon(Icons.add),
        //       heroTag: 'add',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
