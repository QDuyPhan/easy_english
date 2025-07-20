import 'package:easy_english/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.function,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final Function function;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: AppColor.lightSecondary),
      onPressed: () => function(),
      icon: Icon(icon, color: Colors.white),
      label: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}
