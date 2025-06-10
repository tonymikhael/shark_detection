import 'package:AquaSentinels/core/utils/app_colors.dart';
import 'package:AquaSentinels/core/utils/app_styles.dart';
import 'package:AquaSentinels/features/home/views/main_scaffold.dart';
import 'package:AquaSentinels/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScaffold()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightBlue,
              AppColors.primaryColor,
              Colors.black38,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Animate(
                effects: [
                  MoveEffect(
                    begin: Offset(0, -100),
                    end: Offset.zero,
                    duration: 2.seconds,
                    curve: Curves.bounceInOut,
                  ),
                ],
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200.w,
                  height: 200.h,
                ),
              ),
              SizedBox(height: 20.h),
              Animate(
                effects: [
                  SlideEffect(
                    begin: Offset(0, 100),
                    end: Offset.zero,
                    duration: 2.seconds,
                    curve: Curves.bounceInOut,
                  )
                ],
                child: Text(
                  'AquaSentinels',
                  style: AppStyles.headline1(context).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
