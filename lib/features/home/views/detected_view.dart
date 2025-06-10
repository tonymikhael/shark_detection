import 'package:AquaSentinels/core/utils/app_styles.dart';
import 'package:AquaSentinels/core/widgets/custom_appbar.dart';
import 'package:AquaSentinels/features/home/view%20model/cubit/app_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

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
              CustomAppBar(
                leading: 'hiGuard'.tr(),
                action: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
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
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'seeTheDanger'.tr(),
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
                        "thereisShark".tr(),
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
