import 'package:AquaSentinels/core/services/firebase_services.dart';
import 'package:AquaSentinels/core/services/shared_pref.dart';
import 'package:AquaSentinels/features/home/view%20model/cubit/app_cubit.dart';
import 'package:AquaSentinels/features/home/view%20model/cubit/app_state.dart';
import 'package:AquaSentinels/features/home/views/main_scaffold.dart';
import 'package:AquaSentinels/features/home/views/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/data/latest.dart' as tzdata;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Easy Localization
  await EasyLocalization.ensureInitialized();
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

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
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
          buildWhen: (previous, current) =>
              current is ChangeAppThemeState || current is ChangeLanguageState,
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              // Localization
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: Locale(SharedPref().getLanguage()),
              theme: SharedPref.prefs!.getBool('dark') == true
                  ? ThemeData.dark()
                  : ThemeData.light(),
              home: SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
