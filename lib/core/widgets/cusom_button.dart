import 'package:flutter/material.dart';
import 'package:shark_detection/core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.btnColor,
    required this.titleColor,
    this.onPressed,
  });
  final String title;
  final Color btnColor;
  final Color titleColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: AppStyles.body1(context).copyWith(color: titleColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        fixedSize: Size(MediaQuery.sizeOf(context).width * 0.4, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
