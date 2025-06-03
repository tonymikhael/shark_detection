import 'package:flutter/material.dart';
import 'package:shark_detection/core/services/shared_pref.dart';
import 'package:shark_detection/core/utils/app_colors.dart';
import 'package:shark_detection/core/utils/app_styles.dart';

class CustomSettingItem extends StatelessWidget {
  const CustomSettingItem({
    super.key,
    required this.leading,
    required this.icon,
    required this.onTap,
  });

  final String leading;
  final IconData icon;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.primaryColor,
            Colors.lightBlueAccent,
          ]),
          color: Colors.black38,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Text(
            leading,
            style: AppStyles.button(context),
          ),
          trailing: Icon(
            icon,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
