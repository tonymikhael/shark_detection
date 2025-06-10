import 'package:AquaSentinels/core/utils/app_colors.dart';
import 'package:AquaSentinels/features/home/views/home_view.dart';
import 'package:AquaSentinels/features/home/views/live_view.dart';
import 'package:AquaSentinels/features/home/views/setting_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);

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
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('home'.tr()),
            selectedColor: AppColors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.video_camera_back),
            title: Text('liveStream'.tr()),
            selectedColor: AppColors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text('settings'.tr()),
            selectedColor: AppColors.primaryColor,
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
