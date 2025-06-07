import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mjpeg_view/mjpeg_view.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:shark_detection/core/services/supabase_service.dart';
import 'package:shark_detection/core/utils/app_colors.dart';
import 'package:shark_detection/core/utils/app_styles.dart';
import 'package:shark_detection/core/widgets/latest_detection_item.dart';
import 'package:shark_detection/core/widgets/toast.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_cubit.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_state.dart';

class LiveView extends StatelessWidget {
  const LiveView({super.key});

  final String timeZone = 'Africa/Cairo';

  @override
  Widget build(BuildContext context) {
    final url = 'http://192.168.1.8:5000/video';
    var myAppCubit = BlocProvider.of<AppCubit>(context);

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
            BlocListener<AppCubit, AppState>(
              listener: (context, state) {
                if (state is SetFlagState) {
                  showToast(
                    context,
                    title: "Buzzer On",
                    icon: const Icon(Icons.warning),
                    description: 'A Shark detected in the area',
                    bgColor: AppColors.secondaryColor,
                  );
                } else if (state is ResetFlagState) {
                  showToast(
                    context,
                    title: "Buzzer Off",
                    icon: const Icon(Icons.water),
                    description: 'The water is clear',
                    bgColor: AppColors.primaryColor,
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      myAppCubit.setDetectionFlag();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      fixedSize: Size(0.5.sw - 30, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Buzzer On',
                      style: AppStyles.body1(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      myAppCubit.resetDetectionFlag();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      fixedSize: Size(0.5.sw - 30, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Buzzer Off',
                      style: AppStyles.body1(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Latest Shark detection',
              style: AppStyles.subtitle1(context),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: SupabaseService().getAllImagesRealtime(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        'No Detection yet',
                        style: AppStyles.body1(context),
                      ),
                    );
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return LatestDetectionItem(
                        id: data[index]['id'],
                        seen: data[index]['seen'],
                        imageUrl: data[index]['image_url'],
                        detectionTime: convertToTimeZone(
                          data[index]['detection_time'].toString(),
                          timeZone,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String convertToTimeZone(String dateTimeString, String timeZone) {
  DateTime utcTime = DateTime.parse(dateTimeString).toUtc();

  final location = tz.getLocation(timeZone);

  final convertedTime = tz.TZDateTime.from(utcTime, location);

  // Format to readable string
  final formatted = DateFormat('yyyy-MM-dd HH:mm:ss').format(convertedTime);

  return formatted;
}
