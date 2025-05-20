import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:shark_detection/core/services/firestore_services.dart';
import 'package:shark_detection/features/home/view%20model/cubit/app_cubit.dart';
import 'package:shark_detection/main.dart';

class FCMService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeFCM() async {
    // طلب صلاحيات الإشعار
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // التوكن (ممكن تحفظه في Firestore مثلاً)
    String? token = await _messaging.getToken();
    log("FCM Token: $token");
    FirestoreService().saveToken(token: token!);

    // إنشاء قناة الإشعارات (Android)
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'fcm_channel',
      'FCM Notifications',
      description: 'This channel is used for FCM notifications.',
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound('warning'),
      playSound: true,
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // إعداد إشعارات النظام (local)
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await _localNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        print('Notification clicked with payload: ${details.payload}');
        // هنا تقدر تنقل المستخدم لصفحة معينة مثلاً
      },
    );

    // التطبيق شغال
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground Message: ${message.notification?.title}');
      BlocProvider.of<AppCubit>(navigatorKey.currentContext!)
          .setNotificationReceived();
      _showNotification(message);
    });

    // المستخدم فتح التطبيق من إشعار (من الخلفية)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      BlocProvider.of<AppCubit>(navigatorKey.currentContext!)
          .setNotificationReceived();
      print('App opened from notification: ${message.notification?.title}');
      // تقدر تقرأ message.data هنا وتوجه المستخدم
    });

    // التطبيق كان مغلق وفتح من إشعار
    // RemoteMessage? initialMessage =
    //     await FirebaseMessaging.instance.getInitialMessage();
    // if (initialMessage != null) {
    //   // BlocProvider.of<AppCubit>(navigatorKey.currentContext!)
    //   //     .setNotificationReceived();
    //   print(
    //       'App opened from terminated state: ${initialMessage.notification?.title}');
    //   // نفذ أمر معين إذا فتح من إشعار
    // }
  }

  static Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'fcm_channel',
      'FCM Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _localNotificationsPlugin.show(
      message.notification.hashCode,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      notificationDetails,
      payload: message.data['payload'] ?? '',
    );
  }
}
