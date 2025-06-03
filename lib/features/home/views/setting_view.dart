import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_detection/core/utils/app_styles.dart';
import 'package:shark_detection/core/widgets/custom_appbar.dart';
import 'package:shark_detection/core/widgets/custom_setting_item.dart';
import 'package:shark_detection/core/widgets/social_media_button.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_cubit.dart';
import 'package:shark_detection/features/home/views/about_us_view.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(leading: 'Settings'),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey[600],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Apperance',
                  style: AppStyles.subtitle1(context),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomSettingItem(
                leading: 'Change Language',
                icon: Icons.language,
                onTap: () {},
              ),
              CustomSettingItem(
                leading: 'Dark / Light Mode',
                icon: Icons.dark_mode,
                onTap: () {
                  BlocProvider.of<AppCubit>(context).changeAppTheme();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'About Us',
                  style: AppStyles.subtitle1(context),
                ),
              ),
              CustomSettingItem(
                leading: 'About Us',
                icon: Icons.people_alt_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsView()),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Contact Us',
                  style: AppStyles.subtitle1(context),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialMediaButton(
                    bgColor: Colors.black54,
                    imagePath: 'assets/images/facebook-176-svgrepo-com.svg',
                    onTap: () {},
                  ),
                  SocialMediaButton(
                    bgColor: Colors.black54,
                    imagePath: 'assets/images/instagram-svgrepo-com.svg',
                    onTap: () {},
                  ),
                  SocialMediaButton(
                    bgColor: Colors.black54,
                    imagePath: 'assets/images/linkedin-161-svgrepo-com.svg',
                    onTap: () {},
                  ),
                  SocialMediaButton(
                    bgColor: Colors.black54,
                    imagePath: 'assets/images/email.svg',
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
