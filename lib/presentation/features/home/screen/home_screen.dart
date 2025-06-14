import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:flutter/material.dart';
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
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(
            title: 'Hi, 👋',
            actions: [SvgButton(svg: Assets.svgSearch, onPressed: _openSearch)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Discover 🔥',
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDiscoverCard(
                    context,
                    title: '3000 Words',
                    image: Assets.pngWordsList,
                    onTap: () {
                      context.push(RoutePaths.vocabulary);
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildDiscoverCard(
                    context,
                    title: 'Grammar',
                    image: Assets.pngGrammar,
                    onTap: () {
                      context.push(RoutePaths.grammar);
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildDiscoverCard(
                    context,
                    title: 'Topics',
                    image: Assets.pngGrammar,
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  _buildDiscoverCard(
                    context,
                    title: 'My Words',
                    image: Assets.pngGrammar,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openSearch() {
    context.push(RoutePaths.search);
  }

  Widget _buildDiscoverCard(
    BuildContext context, {
    required String title,
    required String image,
    VoidCallback? onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        width: currentWidth,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: colorScheme.primary.withOpacity(0.15),
          border: Border.all(color: colorScheme.primary, width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: currentHeight * 0.15,
              width: double.infinity,
              filterQuality: FilterQuality.high,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(color: colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
