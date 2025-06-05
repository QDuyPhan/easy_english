import 'package:flutter/widgets.dart';

class FlashcardsScreen extends StatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Flashcards'));
  }
}
