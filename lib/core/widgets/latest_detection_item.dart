import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_detection/core/utils/app_colors.dart';
import 'package:shark_detection/core/utils/app_styles.dart';

class LatestDetectionItem extends StatelessWidget {
  const LatestDetectionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: 80.h,
            width: 120.w,
            fit: BoxFit.fill,
            imageUrl:
                "https://d1jyxxz9imt9yb.cloudfront.net/medialib/5080/image/s768x1300/VMIGNONPO1_reduced.jpg",
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error_outline_rounded,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detection Time',
                style: AppStyles.body1(context),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '8:30 2/6/2025',
                style: AppStyles.body2(context).copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
