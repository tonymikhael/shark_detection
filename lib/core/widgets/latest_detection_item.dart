import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_detection/core/services/supabase_service.dart';
import 'package:shark_detection/core/utils/app_colors.dart';
import 'package:shark_detection/core/utils/app_styles.dart';
import 'package:shark_detection/features/home/views/custom_image_view.dart';

class LatestDetectionItem extends StatelessWidget {
  const LatestDetectionItem({
    super.key,
    required this.imageUrl,
    required this.detectionTime,
    required this.seen,
    required this.id,
  });

  final String imageUrl;
  final String detectionTime;
  final bool seen;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black26
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // make the seen true
              SupabaseService().seenImage(id: id);
              //----------------------------------
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return CustomImageView(imageUrl: imageUrl);
                  },
                ),
              );
            },
            child: CachedNetworkImage(
              height: 70.h,
              width: 100.w,
              fit: BoxFit.fill,
              imageUrl: imageUrl,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'detectionTime'.tr(),
                  style: AppStyles.body1(context),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  detectionTime,
                  style:
                      AppStyles.caption(context).copyWith(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    seen
                        ? SizedBox()
                        : Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text('New'),
                          ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
