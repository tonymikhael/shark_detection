import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shark_detection/core/utils/app_styles.dart';
import 'package:shark_detection/core/widgets/custom_appbar.dart';
import 'package:lottie/lottie.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_cubit.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_state.dart';
import 'package:shark_detection/features/home/views/detected_view.dart';
import 'package:shark_detection/features/home/views/not_detected_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        log(state.toString());
      },
      builder: (context, state) {
        if (state is SetSharkDetectedState) {
          return DetectedView();
        } else {
          return NotDetectedView();
        }
      },
    );
  }
}
