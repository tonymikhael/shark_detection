import 'package:flutter/material.dart';
import 'package:shark_detection/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.leading, this.action});

  final String leading;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leading,
          style: AppStyles.headline1(context),
        ),
        action ?? SizedBox(),
      ],
    );
  }
}
