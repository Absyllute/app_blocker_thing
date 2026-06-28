import 'package:app_blocker_thing/home_screen.dart';
import 'package:app_blocker_thing/permission-management/notification_permission_dialogue.dart';
import 'package:flutter/material.dart';

class PermissionHandler {
  static Future<void> requestPermissions() async {
    final notificationStatus = await appBlock.checkNotificationPermission();

    if (notificationStatus != 'granted') {}
  }

  //\\//\\//\\//\\//\\ -- Temporary for testing -- //\\//\\//\\//\\//\\
  static Future<void> notificationPermissionRequest(
    BuildContext context,
  ) async {
    final notificationStatus = await appBlock.checkNotificationPermission();

    if (context.mounted) {
      if (notificationStatus != 'granted') {
        NotificationPermissionDialogue.show(context);
      }
    }
  }
}
