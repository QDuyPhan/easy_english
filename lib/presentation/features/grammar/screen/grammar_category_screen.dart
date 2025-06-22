import 'package:easy_english/core/utils/widgets/app_text_field.dart';
import 'package:easy_english/domain/entities/category_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import '../../../../core/utils/widgets/svg_button.dart';
import '../widgets/grammar_category_item.dart';

class GrammarCategoryScreen extends StatefulWidget {
  final CategoryDataEntity category;

  const GrammarCategoryScreen({super.key, required this.category});

  @override
  State<GrammarCategoryScreen> createState() => _GrammarCategoryScreenState();
}

class _GrammarCategoryScreenState extends State<GrammarCategoryScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final result =
        query.isNotEmpty
            ? widget.category.lessons.where((e) {
              return e.title.toLowerCase().contains(query.toLowerCase()) ||
                  (e.subTitle?.toLowerCase() ?? "").contains(
                    query.toLowerCase(),
                  );
            }).toList()
            : widget.category.lessons;
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: widget.category.title,
            leading: [
              SvgButton(
                svg: Assets.svgArrowLeft,
                onPressed: () => context.pop(),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  AppTextField(
                    hint: 'Search',
                    prefixIcon: const Icon(Icons.search_rounded),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 10),
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return GrammarCategoryItem(lesson: result[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
