import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_detection/core/utils/app_colors.dart';
import 'package:shark_detection/core/utils/app_styles.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hi, Guard",
          style: AppStyles.headline1(context),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<AppCubit>(context).resetNotification();
                },
                icon: Icon(
                  Icons.offline_bolt_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.dark_mode,
                      color: Colors.white,
                    )))
          ],
        ),
      ],
    );
  }
}
