import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kweliscore/models/models.dart';

class NotificationHelper {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  NotificationModel? _notificationInfo;

  NotificationHelper.empty();

  Future<void> _registerNotification() async {
    // On iOS, this helps to take the user permissions
    await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<dynamic> _backgroundHandler(
      Map<String, dynamic> message) async {
    // print('onBackgroundMessage received: $message');
  }

  Future<dynamic> _onLaunch(Map<String, dynamic> message) async {
    // print('onLaunch: $message');
    _notificationInfo = NotificationModel.fromJson(message);
    _notificationInfo.toString();
  }

  Future<dynamic> _onResume(Map<String, dynamic> message) async {
    // print('onResume: $message');
    _notificationInfo = NotificationModel.fromJson(message);
  }

  void notificationHandler(
      [Future<dynamic> Function(Map<String, dynamic>)? _onMessage]) async {
    await _registerNotification();
  }
}
