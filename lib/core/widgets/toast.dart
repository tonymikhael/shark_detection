import 'package:AquaSentinels/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showToast(
  BuildContext context, {
  String title = 'Buzzer On',
  String description = 'A shark detected in the Area',
  Color bgColor = Colors.black12,
  Icon? icon,
}) {
  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(
      title,
      style: AppStyles.body1(context),
    ),
    description: Text(
      description,
      style: AppStyles.caption(context),
    ),
    primaryColor: bgColor,
    icon: icon ?? const Icon(Icons.warning),
    showIcon: true,
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: true,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}
