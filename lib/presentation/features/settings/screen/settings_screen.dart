import 'package:easy_english/domain/entities/theme_entity.dart';
import 'package:easy_english/presentation/features/theme/blocs/theme_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/custom_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state.themeEntity?.themeType == ThemeType.dark;

        return Scaffold(
          body: Column(
            children: [
              CustomAppbar(
                title: 'Settings',
                actions: [
                  IconButton(
                    tooltip: 'Toggle Theme',
                    onPressed: () {
                      context.read<ThemeBloc>().add(
                        const ThemeEvent.toggleTheme(),
                      );
                    },
                    icon: Icon(
                      isDarkMode
                          ? FluentIcons.weather_moon_16_regular
                          : FluentIcons.weather_sunny_16_regular,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: colorScheme.outlineVariant),
                  ),
                  tileColor: colorScheme.surface,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  title: Text(
                    'App Theme',
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  subtitle: Text(
                    isDarkMode ? 'Dark Mode' : 'Light Mode',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  trailing: Switch.adaptive(
                    value: isDarkMode,
                    onChanged: (_) {
                      context.read<ThemeBloc>().add(
                        const ThemeEvent.toggleTheme(),
                      );
                    },
                    activeColor: colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
