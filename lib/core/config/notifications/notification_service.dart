
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
   bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<void> initNotification() async {
    if (_isInitialized) return;
    const initAndroidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: initAndroidSettings);
    await notificationsPlugin.initialize(initSettings);
    _isInitialized = true;
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'default_channel_id',
        'Default Channel',
        channelDescription: 'This is the default channel for notifications',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false,
        playSound: true,
        enableVibration: true,
      ),
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    if (!_isInitialized) {
      await initNotification();
    }
    await notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
    );
  }
}