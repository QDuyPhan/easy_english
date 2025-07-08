import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final List<Widget> leading;
  final List<Widget> actions;
  final List<String>? tabTitles;
  final List<Widget> tabViews;
  final bool? showSearch;
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
                        IconButton(
                          onPressed: onBackPressed ?? () => context.pop(),
                          icon: Icon(
                            FluentIcons.chevron_left_12_regular,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ]
                      : leading,
              actions:
                  actions.isEmpty && onSearchToggle != null
                      ? [
                        IconButton(
                          onPressed: onSearchToggle,
                          icon: Icon(
                            showSearch!
                                ? FluentIcons.dismiss_12_regular
                                : FluentIcons.search_12_regular,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ]
                      : actions,
            ),

            /// TabBar
            if (tabTitles != null && tabTitles!.isNotEmpty)
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorScheme.surfaceVariant.withOpacity(0.5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelColor: colorScheme.onPrimary,
                    unselectedLabelColor: colorScheme.onSurface.withOpacity(
                      0.6,
                    ),
                    labelStyle: textTheme.labelLarge,
                    tabs: tabTitles!.map((title) => Tab(text: title)).toList(),
                  ),
                ),
              ),

            /// Search Box
            if (showSearch! && searchBox != null) searchBox!,

            /// Tab Views
            Expanded(child: TabBarView(children: tabViews)),
          ],
        ),
      ),
    );
  }
}
