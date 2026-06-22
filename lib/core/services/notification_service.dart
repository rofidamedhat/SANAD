import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidSettings = 
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _notificationsPlugin.initialize(settings);
    tz.initializeTimeZones(); 
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'medicine_channel', 
      'Medicine Notifications',
      description: 'تنبيهات مواعيد الأدوية',
      importance: Importance.max,
      playSound: true, 
      enableLights: true,
      enableVibration: true,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> showInstantNotification() async {
    await _notificationsPlugin.show(
      0,
      'تجربة',
      'لو دي ظهرت يبقى الخدمة شغالة!',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'medicine_channel', 
          'Medicine Notifications',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          fullScreenIntent: true,
        ),
      ),
    );
  }

  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required tz.TZDateTime scheduledDate,
  }) async {
    
    tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'medicine_channel', 
          'Medicine Notifications',
          channelDescription: 'تنبيهات مواعيد الأدوية',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          fullScreenIntent: true,
          category: AndroidNotificationCategory.alarm,
        ),
      ),
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime, 
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}