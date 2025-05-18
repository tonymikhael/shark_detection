import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shark_detection/core/utils/app_styles.dart';
import 'package:shark_detection/core/widgets/custom_appbar.dart';

class DetectedView extends StatelessWidget {
  const DetectedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Lottie.asset(
            'assets/images/water_animation2.json',
            fit: BoxFit.cover,
            repeat: true,
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Ready to catch some Shark\'s today?',
                style: AppStyles.subtitle1(context),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.warning,
                        size: 80,
                        color: Colors.red,
                      ),
                      Text(
                        "There is an shark",
                        style: AppStyles.body1(context)
                            .copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/shark_fin.svg',
              color: Colors.blueGrey,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
