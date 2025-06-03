import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/extensions/go_router_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeNavigation extends StatefulWidget {
  final GoRouterState state;
  final StatefulNavigationShell navigationShell;

  static const routes = [
    RoutePaths.home,
    RoutePaths.translate,
    RoutePaths.grammar,
    RoutePaths.studying,
    RoutePaths.settings,
  ];

  static const icons = [
    Assets.svgHouse,
    Assets.svgTranslate,
    Assets.svgBookOpenText,
    Assets.svgBookmarks,
    Assets.svgGearSix,
  ];

  static const labels = [
    "Home",
    "Translate",
    "Grammar",
    "Studying",
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
    var selectedIndex = HomeNavigation.routes.indexOf(currentRoute);
    final colorScheme = Theme.of(context).colorScheme;
    final selectedColor = colorScheme.primary;
    final unselectedColor = Colors.grey[600]!;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(children: [Flexible(child: widget.navigationShell)]),
          ],
        ),
      ),
      // Hiển thị nội dung của tab hiện tại
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex == -1 ? 0 : selectedIndex,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: selectedColor,
          unselectedItemColor: unselectedColor,
          onTap: (index) {
            widget.navigationShell.goBranch(index);
          },
          items: List.generate(
            HomeNavigation.labels.length,
            (item) => BottomNavigationBarItem(
              label: HomeNavigation.labels[item],
              icon: Container(
                decoration: BoxDecoration(
                  color:
                      item == selectedIndex
                          ? colorScheme.primaryContainer
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(
                  HomeNavigation.icons[item],
                  colorFilter: ColorFilter.mode(
                    item == selectedIndex ? selectedColor : unselectedColor,
                    BlendMode.srcIn,
                  ),
                  height: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
