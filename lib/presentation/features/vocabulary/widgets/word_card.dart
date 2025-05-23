import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final WordEntity word;

  const WordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          word.word,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Part of Speech: ${word.pos}'),
            Text('Phonetic: ${word.phonetic}'),
            Text('Status: ${word.status.value}'),
            if (word.userDefinition != null)
              Text('User Definition: ${word.userDefinition!}'),
          ],
        ),
      ),
    );
  }
}
