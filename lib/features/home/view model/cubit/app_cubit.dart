import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_detection/core/services/firebase_services.dart';
import 'package:shark_detection/core/services/firestore_services.dart';
import 'package:shark_detection/core/services/shared_pref.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  void setNotificationReceived() {
    emit(SetSharkDetectedState());
  }

  void resetNotification() {
    emit(ReSetSharkDetectedState());
  }

  void setDetectionFlag() {
    emit(LoadingState());
    FirestoreService().setDetectionFlag();
    emit(SetFlagState());
  }

  void resetDetectionFlag() {
    emit(LoadingState());
    FirestoreService().reSetDetectionFlag();
    emit(ResetFlagState());
  }

  void changeAppTheme() {
    SharedPref().toggleAppTheme();
    emit(ChangeAppThemeState());
  }

  // Add language change method
  void changeLanguage(BuildContext context, String languageCode) {
    context.setLocale(Locale(languageCode));
    SharedPref().setLanguage(languageCode);
    emit(ChangeLanguageState());
  }
}
