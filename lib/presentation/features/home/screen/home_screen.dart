import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_bloc.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_event.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_state.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di.getIt<VocabularyBloc>()..add(const GetAllOxfordWords()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Vocabulary List')),
        body: BlocBuilder<VocabularyBloc, VocabularyState>(
          builder: (context, state) {
            if (state is VocabularyInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VocabularyLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is VocabularyLoaded) {
              return ListView.builder(
                itemCount: state.words.length,
                itemBuilder: (context, index) {
                  final word = state.words[index];
                  return WordCard(word: word);
                },
              );
            }
            return const Center(child: Text('Press button to load words'));
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<VocabularyBloc>().add(const GetAllOxfordWords());
              },
              child: const Icon(Icons.refresh),
              heroTag: 'refresh',
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                // context.read<VocabularyBloc>().add(const AddWordRandomly());
              },
              child: const Icon(Icons.add),
              heroTag: 'add',
            ),
          ],
        ),
      ),
    );
  }
}
