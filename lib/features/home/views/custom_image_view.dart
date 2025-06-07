import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shark_detection/core/utils/app_colors.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: Center(
        child: PhotoView(
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 3,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Icon(Icons.error),
            );
          },
          loadingBuilder: (context, event) {
            return CircularProgressIndicator(
              color: AppColors.primaryColor,
            );
          },
          imageProvider: NetworkImage(imageUrl),
          backgroundDecoration: BoxDecoration(color: Colors.black),
        ),
      ),
    );
  }
}
