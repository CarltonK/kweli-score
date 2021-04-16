import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:overlay_support/overlay_support.dart';

class NotificationHelper {
  FirebaseMessaging _messaging = FirebaseMessaging();
  NotificationModel _notificationInfo;

  NotificationHelper.empty();

  Future<void> _registerNotification() async {
    // On iOS, this helps to take the user permissions
    await _messaging.requestNotificationPermissions(
      IosNotificationSettings(
        alert: true,
        badge: true,
        provisional: false,
        sound: true,
      ),
    );
  }

  Future<dynamic> _onMessage(Map<String, dynamic> message) async {
    print('onMessage received: $message');

    // Parse the message received
    _notificationInfo = NotificationModel.fromJson(message);

    showSimpleNotification(
      Text(_notificationInfo.title),
      leading: NotificationBadge(),
      subtitle: Text(_notificationInfo.body),
      background: Colors.cyan[700],
      duration: Duration(seconds: 2),
    );
  }

  static Future<dynamic> _backgroundHandler(
      Map<String, dynamic> message) async {
    print('onBackgroundMessage received: $message');
  }

  Future<dynamic> _onLaunch(Map<String, dynamic> message) async {
    print('onLaunch: $message');
    _notificationInfo = NotificationModel.fromJson(message);
  }

  Future<dynamic> _onResume(Map<String, dynamic> message) async {
    print('onResume: $message');
    _notificationInfo = NotificationModel.fromJson(message);
  }

  void notificationHandler() async {
    await _registerNotification();
    _messaging.configure(
      onMessage: _onMessage,
      onLaunch: _onLaunch,
      onResume: _onResume,
      onBackgroundMessage: _backgroundHandler,
    );
  }
}
