import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Text text;
  final Color? backgroundColor;
  final List<Widget> actions;
  final bool centerTitle;
  final List<Widget> leading;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? titleStyle;

  final List<Tab>? tabs;
  final TabController? tabController;
  final bool? isTabScrollable;
  final TabAlignment? tabAlignment;

  const CustomAppbar({
    super.key,
    required this.text,
    this.backgroundColor,
    this.actions = const [],
    this.centerTitle = true,
    this.leading = const [],
    this.tabs,
    this.tabController,
    this.isTabScrollable,
    this.tabAlignment,
    this.indicatorColor = Colors.redAccent,
    this.labelColor = Colors.white,
    this.unselectedLabelColor = Colors.white70,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final hasTabs = tabs != null && tabs!.isNotEmpty && tabController != null;
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      title: text,
      backgroundColor: colorScheme.onPrimary,
      elevation: 0,
      actions: actions,
      centerTitle: centerTitle,
      leading:
          leading.isNotEmpty
              ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(mainAxisSize: MainAxisSize.min, children: leading),
              )
              : null,
      bottom:
          hasTabs
              ? TabBar(
                controller: tabController,
                tabs: tabs!,
                indicatorColor: indicatorColor,
                labelColor: labelColor,
                unselectedLabelColor: unselectedLabelColor,
                isScrollable:
                    tabAlignment != null ? true : (isTabScrollable ?? false),
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: tabAlignment,
                dividerColor: Colors.transparent,

                // indicator: BoxDecoration(
                //   borderRadius: BorderRadius.circular(8.0),
                //   color: Colors.redAccent,
                // ),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
              : null,
    );
  }

  @override
  Size get preferredSize {
    final hasTabs = tabs != null && tabs!.isNotEmpty && tabController != null;
    return Size.fromHeight(kToolbarHeight + (hasTabs ? kTextTabBarHeight : 0));
  }
}
