import 'package:easy_english/core/utils/widgets/app_text_field.dart';
import 'package:easy_english/domain/entities/category_data_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_appbar.dart';

class GrammarCategoryScreen extends StatefulWidget {
  final CategoryDataEntity category;
  const GrammarCategoryScreen({super.key, required this.category});

  @override
  State<GrammarCategoryScreen> createState() => _GrammarCategoryScreenState();
}

class _GrammarCategoryScreenState extends State<GrammarCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: widget.category.title),
          Column(
            children: [
              AppTextField(
                hint: 'Search',
                prefixIcon: const Icon(Icons.search_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
