import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final List<Widget> leading;
  final List<Widget> actions;
  final List<String>? tabTitles;
  final List<Widget> tabViews;
  final bool showSearch;
  final VoidCallback? onSearchToggle;
  final Widget? searchBox;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const BaseScreen({
    super.key,
    required this.title,
    this.leading = const [],
    this.actions = const [],
    this.tabTitles,
    required this.tabViews,
    this.showSearch = false,
    this.onSearchToggle,
    this.searchBox,
    this.showBackButton = true,
    this.onBackPressed,
  }) : assert(tabTitles == null || tabTitles.length == tabViews.length);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles?.length ?? 1,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppbar(
              title: title,
              leading:
                  leading.isEmpty && showBackButton
                      ? [
                        SvgButton(
                          svg: Assets.svgArrowLeft,
                          onPressed: onBackPressed ?? () => context.pop(),
                        ),
                      ]
                      : leading,
              actions:
                  actions.isEmpty && onSearchToggle != null
                      ? [
                        SvgButton(
                          svg:
                              showSearch
                                  ? Assets.svgClose
                                  : Assets.svgSearch,
                          onPressed: onSearchToggle,
                        ),
                      ]
                      : actions,
            ),
            if (tabTitles != null && tabTitles!.isNotEmpty)
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: AppColor.black40,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: const BoxDecoration(
                      color: AppColor.primary100,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    tabs: tabTitles!.map((title) => Tab(text: title)).toList(),
                  ),
                ),
              ),
            if (showSearch && searchBox != null) searchBox!,
            Expanded(child: TabBarView(children: tabViews)),
          ],
        ),
      ),
    );
  }
}
