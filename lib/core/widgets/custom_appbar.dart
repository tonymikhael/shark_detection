import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shark_detection/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hi, Shark",
          style: AppStyles.headline1(context),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
