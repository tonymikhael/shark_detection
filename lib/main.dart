import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_detection/core/services/firebase_services.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_cubit.dart';
import 'package:shark_detection/features/home/views/main_scaffold.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  BlocProvider.of<AppCubit>(navigatorKey.currentContext!)
      .setNotificationReceived();
  print('Background Message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FCMService.initializeFCM();
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
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData.dark(),
        home: MainScaffold(),
      ),
    );
  }
}
