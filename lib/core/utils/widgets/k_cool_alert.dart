import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

Future kCoolAlert({
  required String message,
  required BuildContext context,
  required CoolAlertType alert,
  bool barrierDismissible = true,
  String confirmBtnText = 'Ok',
}) {
  return CoolAlert.show(
    backgroundColor: AppColor.lightPrimary,
    confirmBtnColor: AppColor.lightSecondary,
    context: context,
    type: alert,
    text: message,
    barrierDismissible: barrierDismissible,
    confirmBtnText: confirmBtnText,
  );
}
