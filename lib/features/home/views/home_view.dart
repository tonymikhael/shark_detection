import 'dart:developer';

import 'package:AquaSentinels/features/home/view%20model/cubit/app_cubit.dart';
import 'package:AquaSentinels/features/home/view%20model/cubit/app_state.dart';
import 'package:AquaSentinels/features/home/views/detected_view.dart';
import 'package:AquaSentinels/features/home/views/not_detected_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
