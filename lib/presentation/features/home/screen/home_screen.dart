import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:easy_english/presentation/features/topics/widgets/topic_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: 'Welcome to Vocabulary App',
            actions: [SvgButton(svg: Assets.svgSearch, onPressed: _openSearch)],
          ),
        ],
      ),
    );
  }

  void _openSearch() {
    context.push(RoutePaths.search);
  }
}
