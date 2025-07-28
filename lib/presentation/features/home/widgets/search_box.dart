import 'package:easy_english/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

import '../../../../core/utils/widgets/app_text_field.dart';
import '../../search/blocs/search_bloc.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController controller;
  final Debouncer debouncer;

  const SearchBox({
    super.key,
    required this.controller,
    required this.debouncer,
  });

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {}); // trigger UI rebuild when controller.text changes
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      hint: 'Search words...',
      prefixIcon: const Icon(Icons.search_rounded),
      suffixIcon:
          widget.controller.text.isNotEmpty
              ? GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _onClear(context);
                  app_config.printLog('i', 'Cleared search');
                },
                child: const Icon(Icons.close),
              )
              : null,
      onChanged: (value) => _onSearchChanged(context, value),
    );
  }

  void _onClear(BuildContext context) {
    widget.controller.clear();
    context.read<SearchBloc>().add(const SearchEvent.clearSearch());
  }

  void _onSearchChanged(BuildContext context, String value) {
    if (value.trim().isEmpty) {
      context.read<SearchBloc>().add(const SearchEvent.clearSearch());
      return;
    }

    widget.debouncer.debounce(
      duration: const Duration(milliseconds: 300),
      onDebounce: () {
        context.read<SearchBloc>().add(SearchEvent.searchWords(query: value));
      },
    );
  }
}
