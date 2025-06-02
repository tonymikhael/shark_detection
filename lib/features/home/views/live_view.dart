import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjpeg_view/mjpeg_view.dart';
import 'package:shark_detection/core/utils/app_colors.dart';
import 'package:shark_detection/core/utils/app_styles.dart';
import 'package:shark_detection/core/widgets/latest_detection_item.dart';

class LiveView extends StatefulWidget {
  const LiveView({super.key});

  @override
  State<LiveView> createState() => _LiveViewState();
}

class _LiveViewState extends State<LiveView> {
  // To force the Image widget to reload
  late Timer _timer;
  int _reloadCounter = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _reloadCounter++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final url = 'http://192.168.1.8:5000/video';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: MjpegView(
                uri: url,
                fps: 30,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    fixedSize: Size(0.5.sw - 30, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: Text(
                    'Buzzer On',
                    style: AppStyles.body1(context),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    fixedSize: Size(0.5.sw - 30, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: Text(
                    'Buzzer Off',
                    style: AppStyles.body1(context),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Latest Shark detection',
              style: AppStyles.subtitle1(context),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return LatestDetectionItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
