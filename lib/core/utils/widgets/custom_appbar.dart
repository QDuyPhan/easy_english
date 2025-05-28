import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final List<Widget> actions;

  const CustomAppbar({super.key, required this.title, required this.actions});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
