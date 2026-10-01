import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

/// خدمة الإشعارات — تدير FCM Token والإشعارات المحلية
class NotificationService {
  final FirebaseMessaging _messaging;
  final FirebaseFirestore _firestore;
  final FlutterLocalNotificationsPlugin _localNotifications;

  NotificationService({
    FirebaseMessaging? messaging,
    FirebaseFirestore? firestore,
    FlutterLocalNotificationsPlugin? localNotifications,
  })  : _messaging = messaging ?? FirebaseMessaging.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _localNotifications = localNotifications ?? FlutterLocalNotificationsPlugin();

/// تهيئة الإشعارات ومعالجة الـ Foreground عبر المكتبة المحلية
  Future<void> initFcm(String userId) async {
    try {
      // 1. طلب الإذن أولاً
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      log('Notification permission: ${settings.authorizationStatus}');

      // 2. تهيئة إعدادات المكتبة المحلية
      const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
      const iosSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );
      const initSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);
      await _localNotifications.initialize(initSettings);

      // 3. إنشاء قناة عالية الأهمية للأندرويد لإظهار الإشعار في أعلى الشاشة (Banner/Heads-up)
      final androidPlugin = _localNotifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      const foregroundChannel = AndroidNotificationChannel(
        'foreground_notifications_channel', // معرف القناة
        'Foreground Notifications', // اسم القناة
        description: 'This channel is used for in-app push notifications',
        importance: Importance.max, // إظهار الإشعار فوراً في أعلى الشاشة
        playSound: true,
      );

      await androidPlugin?.createNotificationChannel(foregroundChannel);

      // 4. حفظ وأخذ الـ Token
      final token = await _messaging.getToken();
      if (token != null) {
        log('FCM Token obtained: ${token.substring(0, 20)}...');
        await saveTokenToFirestore(userId, token);
      }

      // 5. 🎯 النقطة الأساسية: الاستماع للإشعارات والتطبيق مفتوح (Foreground)
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        log('Foreground message received: ${message.notification?.title}');
        
        // عند وصول أي إشعار والتطبيق مفتوح، نقوم بإظهاره فوراً عبر المكتبة المحلية
        _showForegroundLocalNotification(message);
      });

    } catch (e) {
      log('FCM init error: $e');
    }
  }

  /// دالة عرض الإشعار المحلي عند استقبال رسالة من Firebase والتطبيق مفتوح
  Future<void> _showForegroundLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    const androidDetails = AndroidNotificationDetails(
      'foreground_notifications_channel', // استخدام نفس معرف القناة عالية الأهمية
      'Foreground Notifications',
      channelDescription: 'This channel is used for in-app push notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      icon: '@mipmap/ic_launcher',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    // عرض الإشعار محلياً
    await _localNotifications.show(
      message.hashCode,
      notification.title ?? 'TaskFlow',
      notification.body ?? '',
      details,
    );
  }

  // /// تهيئة الإشعارات: الإذن + FCM Token + معالج الرسائل الأمامية + الإشعار اليومي
  // Future<void> initFcm(String userId) async {
  //   try {
  //     // طلب الإذن
  //     final settings = await _messaging.requestPermission(
  //       alert: true,
  //       badge: true,
  //       sound: true,
  //     );
  //     log('Notification permission: ${settings.authorizationStatus}');

  //     // تهيئة الإشعارات المحلية
  //     const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  //     const iosSettings = DarwinInitializationSettings(
  //       requestAlertPermission: true,
  //       requestBadgePermission: true,
  //       requestSoundPermission: true,
  //     );
  //     const initSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);
  //     await _localNotifications.initialize(initSettings);

  //     // إنشاء قنوات الإشعارات للأندرويد
  //     final androidPlugin = _localNotifications
  //         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

  //     // قناة الإشعارات اليومية
  //     const androidChannelDaily = AndroidNotificationChannel(
  //       'daily_reminders',
  //       'Daily Reminders',
  //       description: 'Daily motivational reminders',
  //       importance: Importance.high,
  //     );
  //     await androidPlugin?.createNotificationChannel(androidChannelDaily);

  //     // قناة إشعارات المهام/Firebase الفورية
  //     const androidChannelTask = AndroidNotificationChannel(
  //       'task_channel',
  //       'Task Notifications',
  //       description: 'Notifications for task reminders and Firebase messages',
  //       importance: Importance.high,
  //     );
  //     await androidPlugin?.createNotificationChannel(androidChannelTask);

  //     // جدولة الإشعار اليومي التحفيزي الساعة 9:00 صباحاً
  //     await scheduleDailyMotivationalNotification();

  //     // الحصول على Token
  //     final token = await _messaging.getToken();
  //     if (token != null) {
  //       log('FCM Token obtained: ${token.substring(0, 20)}...');
  //       await saveTokenToFirestore(userId, token);
  //     }

  //     // الاستماع لتحديثات Token
  //     _messaging.onTokenRefresh.listen((newToken) {
  //       log('FCM Token refreshed');
  //       saveTokenToFirestore(userId, newToken);
  //     });

  //     // معالج الرسائل الأمامية (Foreground Messages)
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       log('Foreground message received: ${message.notification?.title}');
  //       _showLocalNotification(message);
  //     });

  //     // عند فتح التطبيق بالضغط على إشعار
  //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //       log('Notification opened app: ${message.notification?.title}');
  //     });
  //   } catch (e) {
  //     log('FCM init error: $e');
  //   }
  // }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    await showNotification(
      id: message.hashCode,
      title: message.notification?.title ?? 'TaskFlow',
      body: message.notification?.body ?? '',
    );
  }

  /// جدولة إشعار يومي تحفيزي الساعة 9:00 صباحاً
  Future<void> scheduleDailyMotivationalNotification() async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'daily_reminders',
        'Daily Reminders',
        channelDescription: 'Daily motivational reminders',
        importance: Importance.high,
        priority: Priority.high,
      );
      const iosDetails = DarwinInitializationSettings();
      const details = NotificationDetails(android: androidDetails);

      // حساب وقت 9:00 صباحاً من اليوم أو الغد
      final now = DateTime.now();
      var scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 9, 0);
      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }

      await _localNotifications.zonedSchedule(
        0, // معرف ثابت للإشعار اليومي
        'Good Morning! ☀️️',
        'You have tasks waiting for you today, let\'s get them done!',
        scheduledDate,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time, // تكرار يومي
      );
      log('Daily motivational notification scheduled for 9:00 AM');
    } catch (e) {
      log('Error scheduling daily notification: $e');
    }
  }

  /// جدولة تذكير مهمة بالإشعارات المحلية
  Future<void> scheduleTaskNotification(String taskId, String title, DateTime reminderDateTime) async {
    try {
      // لا تجدول إذا كان الوقت في الماضي
      if (reminderDateTime.isBefore(DateTime.now())) {
        log('Reminder time is in the past, skipping: $reminderDateTime');
        return;
      }

      const androidDetails = AndroidNotificationDetails(
        'task_reminders',
        'Task Reminders',
        channelDescription: 'Scheduled reminders for tasks',
        importance: Importance.high,
        priority: Priority.high,
      );
      const iosDetails = DarwinNotificationDetails();
      const details = NotificationDetails(android: androidDetails, iOS: iosDetails);

      final scheduledDate = tz.TZDateTime.from(reminderDateTime, tz.local);

      await _localNotifications.zonedSchedule(
        taskId.hashCode,
        'taskReminder'.tr(),
        title,
        scheduledDate,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );
      log('Scheduled reminder for task: $title at $reminderDateTime');
    } catch (e) {
      log('Error scheduling reminder: $e');
    }
  }

  /// إلغاء تذكير مهمة
  Future<void> cancelTaskNotification(String taskId) async {
    await _localNotifications.cancel(taskId.hashCode);
    log('Cancelled reminder for task: $taskId');
  }

  /// عرض إشعار محلي من رسالة FCM
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'task_channel',
      'Task Notifications',
      channelDescription: 'Notifications for task reminders',
      importance: Importance.high,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _localNotifications.show(
      id,
      title,
      body,
      details,
    );
  }

  /// حفظ FCM Token في Firestore
  Future<void> saveTokenToFirestore(String userId, String token) async {
    try {
      await _firestore.collection('users').doc(userId).set(
        {'fcmToken': token},
        SetOptions(merge: true),
      );
      log('FCM Token saved for user: $userId');
    } catch (e) {
      log('Error saving FCM Token: $e');
    }
  }

  /// حذف FCM Token عند تسجيل الخروج
  Future<void> removeToken(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'fcmToken': FieldValue.delete(),
      });
      log('FCM Token removed for user: $userId');
    } catch (e) {
      log('Error removing FCM Token: $e');
    }
  }
}