import 'package:AquaSentinels/core/utils/app_styles.dart';
import 'package:AquaSentinels/core/widgets/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  leading: 'aboutUs'.tr(),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey[600],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'appNameLogo'.tr(),
                  style: AppStyles.subtitle1(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'App Name: AquaSentinels',
                      style: AppStyles.body2(context),
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 100.w,
                      height: 100.h,
                    ),
                  ],
                ),
                Text(
                  'shortIntro'.tr(),
                  style: AppStyles.subtitle1(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'shortIntroBody'.tr(),
                  style: AppStyles.body2(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'ourMission'.tr(),
                  style: AppStyles.subtitle1(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'ourMissionBody'.tr(),
                  style: AppStyles.body2(context),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'howItWorks'.tr(),
                  style: AppStyles.subtitle1(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'howItWorksBody'.tr(),
                  style: AppStyles.body2(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'technologyUsed'.tr(),
                  style: AppStyles.subtitle1(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'technologyUsedBody'.tr(),
                  style: AppStyles.body2(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
