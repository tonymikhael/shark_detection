import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_detection/core/utils/app_styles.dart';
import 'package:shark_detection/core/widgets/custom_appbar.dart';

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
                  leading: 'About Us',
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
                  'App Name & Logo',
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
                  'Short Introduction',
                  style: AppStyles.subtitle1(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Shark Detection is an innovative application designed to enhance beach safety by using AI-powered camera systems to detect sharks in real-time',
                  style: AppStyles.body2(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Our Mission',
                  style: AppStyles.subtitle1(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Our mission is to protect lives by providing early warnings of shark presence through smart surveillance technology, helping lifeguards and beachgoers stay safe.',
                  style: AppStyles.body2(context),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'How it works',
                  style: AppStyles.subtitle1(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '. The app connects with live camera feeds',
                  style: AppStyles.body2(context),
                ),
                Text(
                  '. YOLOv8 AI model analyzes the video to detect sharks.',
                  style: AppStyles.body2(context),
                ),
                Text(
                  '. If a shark is detected, an alarm is triggered and a notification is sent instantly.',
                  style: AppStyles.body2(context),
                ),
                Text(
                  '. The app also provides a live view from the camera for real-time monitoring.',
                  style: AppStyles.body2(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Technology Used',
                  style: AppStyles.subtitle1(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '. YOLOv8 for object detection',
                  style: AppStyles.body2(context),
                ),
                Text(
                  '. Jetson Device for edge processing',
                  style: AppStyles.body2(context),
                ),
                Text(
                  '. Firebase for real-time notification',
                  style: AppStyles.body2(context),
                ),
                Text(
                  '. Flutter for mobile interface',
                  style: AppStyles.body2(context),
                ),
                Text(
                  '. Supabase for image storage',
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
