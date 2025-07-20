import 'dart:io';
import 'package:easy_english/core/utils/create_uid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

Future<void> customAlertDialog({
  required String title,
  required String content,
  required BuildContext context,
  required Function action,
  required String button1Title,
  required String button2Title,
}) {
  return showDialog(
    context: context,
    builder:
        (context) =>
            // FOR iOS
            Platform.isIOS
                ? CupertinoAlertDialog(
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  content: Text(content),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          backgroundColor: AppColor.lightSecondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => action(),
                        child: Text(
                          button1Title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          backgroundColor: AppColor.lightSecondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          button2Title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                // FOR Android
                : AlertDialog(
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  content: Text(content),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.lightSecondary,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => action(),
                      child: Text(
                        button1Title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.lightSecondary,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        button2Title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
  );
}
