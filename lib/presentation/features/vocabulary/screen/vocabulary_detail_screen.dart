import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:flutter/material.dart';

class VocabularyDetailScreen extends StatelessWidget {
  final WordEntity word;

  const VocabularyDetailScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vocabulary Detail')),
      body: Center(child: Text(word.word)),
    );
  }
}
