import 'package:easy_english/domain/entities/theme_entity.dart';
import 'package:easy_english/presentation/features/theme/blocs/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import '../../../../core/utils/widgets/svg_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              CustomAppbar(
                title: 'Settings',
                actions: [
                  SvgButton(
                    svg:
                        state.themeEntity?.themeType == ThemeType.dark
                            ? Assets.svgMoon
                            : Assets.svgSun,
                    onPressed: _onChangeTheme,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _onChangeTheme() {
    context.read<ThemeBloc>().add(const ThemeEvent.toggleTheme());
  }
}
