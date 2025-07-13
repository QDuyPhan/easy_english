import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final List<Widget> leading;
  final List<Widget> actions;
  final Widget? child;
  final TextAlign titleAlign;

  const CustomAppbar({
    super.key,
    required this.title,
    this.leading = const [],
    this.actions = const [],
    this.child,
    this.titleAlign = TextAlign.center, r
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isDark = theme.brightness == Brightness.dark;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
          statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        ),
      );
    });

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (titleAlign == TextAlign.center)
                    Center(
                      child: Text(
                        title.toUpperCase(),
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  else
                    Align(
                      alignment: titleAlign == TextAlign.left
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        title.toUpperCase(),
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: leading,
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: actions,
                    ),
                  ),
                ],
              ),
            ),
            if (child != null) ...[const SizedBox(height: 8), child!],
          ],
        ),
      ),
    );
  }
}
