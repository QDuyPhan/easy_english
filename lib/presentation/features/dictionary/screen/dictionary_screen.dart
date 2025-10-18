import 'package:easy_english/core/utils/widgets/custom_app_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/dictionary_entity.dart';
import '../../topics/widgets/topic_box.dart';
import '../bloc/dictionary_bloc.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DictionaryBloc>().add(const DictionaryEvent.getDictionary());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictionaryBloc, DictionaryState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomAppBar(
            title: 'Mini Dictionary',
            leading: [
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(FluentIcons.chevron_left_12_regular),
              ),
            ],
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              physics: const BouncingScrollPhysics(),
              itemCount: state.dictionary.length,
              itemBuilder: (context, index) {
                final DictionaryEntity dictionary = state.dictionary[index];
                return TopicBox(index: index, dictionary: dictionary);
              },
            ),
          ),
        );
      },
    );
  }
}
