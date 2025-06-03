import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shark_detection/core/services/firebase_services.dart';
import 'package:shark_detection/core/services/shared_pref.dart';
import 'package:shark_detection/core/services/supabase_service.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_cubit.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_state.dart';
import 'package:shark_detection/features/home/views/main_scaffold.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/data/latest.dart' as tzdata;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  BlocProvider.of<AppCubit>(navigatorKey.currentContext!)
      .setNotificationReceived();
  print('Background Message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize timezone to egypt
  tzdata.initializeTimeZones();
  await SharedPref().init();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FCMService.initializeFCM();

  await Supabase.initialize(
    url: 'https://jigmgjiercwnsyevrnbc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImppZ21namllcmN3bnN5ZXZybmJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg4NjI0MzMsImV4cCI6MjA2NDQzODQzM30.xG8GftrQENz8ppgB4Fcy2-Ih1hTjKovlMSIqWGjs-20',
  );

  SupabaseService().getAllImagesRealtime;

  runApp(MyApp());
  Future.delayed(Duration.zero, () async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print(
          'App opened from terminated state: ${initialMessage.notification?.title}');
      final context = navigatorKey.currentContext;
      if (context != null) {
        BlocProvider.of<AppCubit>(context).setNotificationReceived();
      }
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              theme: SharedPref.prefs!.getBool('dark') == true
                  ? ThemeData.dark()
                  : ThemeData.light(),
              home: MainScaffold(),
            );
          },
        ),
      ),
    );
  }
}
