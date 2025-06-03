import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_detection/core/utils/app_colors.dart';
import 'package:shark_detection/core/utils/app_styles.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_cubit.dart';

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
        action??SizedBox(),
      ],
    );
  }
}
