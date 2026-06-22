// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();
//
//   // 1. دالة طلب الإذن
//   static Future<void> requestPermission() async {
//     await _messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       sound: true,
//     );
//   }
//   static Future<void> setupNotifications() async {
//
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const InitializationSettings initializationSettings =
//     InitializationSettings(android: initializationSettingsAndroid);
//
//     await _localNotifications.initialize(settings: initializationSettings);
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       importance: Importance.max,
//     );
//
//     await _localNotifications
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//
//       if (notification != null && android != null) {
//         _localNotifications.show(
//           id: notification.hashCode,
//           title: notification.title,
//           body: notification.body,
//           notificationDetails: NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               importance: Importance.max,
//               priority: Priority.high,
//               icon: '@mipmap/ic_launcher',
//             ),
//           ),
//         );
//       }
//     });
//   }
//   // 2. دالة تهيئة الإشعارات والـ Foreground
//   // static Future<void> setupNotifications() async {
//   //   // إعدادات أندرويد (القناة)
//   //   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   //     'high_importance_channel',
//   //     'High Importance Notifications',
//   //     importance: Importance.max,
//   //   );
//   //
//   //   await _localNotifications
//   //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//   //       ?.createNotificationChannel(channel);
//   //
//   //   // استلام الإشعارات والأبلكيشن مفتوح
//   //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //     if (message.notification != null) {
//   //       _localNotifications.show(
//   //         message.notification.hashCode,
//   //         message.notification!.title,
//   //         message.notification!.body,
//   //         NotificationDetails(
//   //           android: AndroidNotificationDetails(
//   //             channel.id,
//   //             channel.name,
//   //             importance: Importance.max,
//   //             priority: Priority.high,
//   //           ),
//   //         ),
//   //       );
//   //     }
//   //   });
//   // }
// }