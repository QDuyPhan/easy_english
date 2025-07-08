import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/extensions/go_router_extension.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeNavigation extends StatefulWidget {
  final GoRouterState state;
  final StatefulNavigationShell navigationShell;

  static const routes = [
    RoutePaths.home,
    RoutePaths.dictionary,
    RoutePaths.grammar,
    RoutePaths.studying,
    RoutePaths.settings,
  ];

  static final List<IconData> icons = [
    FluentIcons.home_16_regular,
    FluentIcons.book_letter_20_regular,
    FluentIcons.book_open_16_regular,
    FluentIcons.bookmark_16_regular,
    FluentIcons.settings_16_regular,
  ];

  static const labels = [
    "Home",
    "Dictionary",
    "Grammar",
    "My Words",
    "Settings",
  ];

  const HomeNavigation({
    super.key,
    required this.state,
    required this.navigationShell,
  });

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouter.of(context).currentRoute;
    final colorScheme = Theme.of(context).colorScheme;
    final selectedIndex = HomeNavigation.routes.indexOf(currentRoute);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(children: [Flexible(child: widget.navigationShell)]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex == -1 ? 0 : selectedIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: colorScheme.surface,
        elevation: 0,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withOpacity(0.6),
        selectedIconTheme: IconThemeData(color: colorScheme.primary),
        unselectedIconTheme: IconThemeData(
          color: colorScheme.onSurface.withOpacity(0.6),
        ),

        onTap: (index) {
          widget.navigationShell.goBranch(index);
        },

        items: List.generate(
          HomeNavigation.labels.length,
          (index) => BottomNavigationBarItem(
            label: HomeNavigation.labels[index],
            icon: Icon(HomeNavigation.icons[index]),
          ),
        ),
      ),
    );
  }
}
