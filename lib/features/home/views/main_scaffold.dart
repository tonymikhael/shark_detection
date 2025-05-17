import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shark_detection/core/utils/app_colors.dart';
import 'package:shark_detection/features/home/views/home_view.dart';
import 'package:shark_detection/features/home/views/live_view.dart';
import 'package:shark_detection/features/home/views/statistics_view.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int currentIndex = 0;
  List screens = [
    HomeView(),
    LiveView(),
    StatisticsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
          print(currentIndex);
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: AppColors.primaryColor,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.video_camera_back),
            title: Text("Live stream"),
            selectedColor: AppColors.primaryColor,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.data_saver_off_sharp),
            title: Text("statistics"),
            selectedColor: AppColors.primaryColor,
          ),

          /// Profile
          // SalomonBottomBarItem(
          //   icon: Icon(Icons.person),
          //   title: Text("Profile"),
          //   selectedColor: Colors.teal,
          // ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
