import 'package:easy_english/core/utils/widgets/app_text_field.dart';
import 'package:easy_english/domain/entities/category_data_entity.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/widgets/custom_appbar.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
      backgroundColor: colorScheme.surface,
      body: Column(
        children: [
          CustomAppbar(
            title: widget.category.title,
            leading: [
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  FluentIcons.chevron_left_12_regular,
                  color: colorScheme.onSurface,
                ),
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
                    onChanged: (val) {
                      setState(() => query = val);
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: result.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
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
