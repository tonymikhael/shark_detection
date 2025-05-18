import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<bool> {
  AppCubit() : super(false);

  void setNotificationReceived() => emit(true);

  void resetNotification() => emit(false);
}
