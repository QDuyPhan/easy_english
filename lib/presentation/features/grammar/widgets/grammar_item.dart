import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/domain/entities/category_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GrammarItem extends StatelessWidget {
  final CategoryDataEntity category;

  const GrammarItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.push(RoutePaths.grammarCategory, extra: {'category': category});
      },
      child: Container(
        width: size.width,
        height: size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          children: [Text(category.title), Text(category.description)],
        ),
      ),
    );
  }
}
