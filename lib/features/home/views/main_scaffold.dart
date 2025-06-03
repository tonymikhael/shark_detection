import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shark_detection/core/services/supabase_service.dart';
import 'package:shark_detection/core/utils/app_colors.dart';
import 'package:shark_detection/features/home/views/about_us_view.dart';
import 'package:shark_detection/features/home/views/home_view.dart';
import 'package:shark_detection/features/home/views/live_view.dart';
import 'package:shark_detection/features/home/views/setting_view.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int currentIndex = 0;
  List screens = const [
    HomeView(),
    LiveView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: AppColors.primaryColor,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.video_camera_back),
            title: Text("Live stream"),
            selectedColor: AppColors.primaryColor,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
            selectedColor: AppColors.primaryColor,
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
