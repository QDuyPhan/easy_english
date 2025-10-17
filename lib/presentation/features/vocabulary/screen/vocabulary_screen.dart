import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/app_route_paths.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      // context.read<VocabularyBloc>().add(const GetAllOxfordWords());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: CustomAppbar(
        text: const Text('Vocabulary'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        leading: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(FluentIcons.chevron_left_12_regular),
          ),
        ],
        actions: [
          IconButton(
            onPressed: () => context.push(AppRoutePaths.search),
            icon: const Icon(FluentIcons.search_12_regular),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
