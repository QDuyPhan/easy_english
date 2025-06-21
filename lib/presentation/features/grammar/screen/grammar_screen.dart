import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/grammar_item.dart';

class GrammarScreen extends StatefulWidget {
  const GrammarScreen({super.key});

  @override
  State<GrammarScreen> createState() => _GrammarScreenState();
}

class _GrammarScreenState extends State<GrammarScreen> {
  final categories = Assets.categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: 'Grammar'),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.separated(
                separatorBuilder:
                    (context, index) => const SizedBox(height: 12),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GrammarItem(category: categories[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
