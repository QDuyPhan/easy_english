import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:flutter/material.dart';

class Phonetic extends StatefulWidget {
  final String phonetic;
  final String phoneticText;
  final String flag;
  final Color backgroundColor;

  const Phonetic({
    super.key,
    required this.phonetic,
    required this.phoneticText,
    required this.backgroundColor,
    required this.flag,
  });

  @override
  State<Phonetic> createState() => _PhoneticState();
}

class _PhoneticState extends State<Phonetic> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.flag),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgButton(
              svg: Assets.svgVolume,
              size: 16,
              color: AppColor.black0,
              backgroundColor: widget.backgroundColor,
              onPressed: _playSound,
            ),
            SizedBox(width: 8),
            Text(
              widget.phoneticText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }

  void _playSound() async {}
}
