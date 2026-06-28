import 'package:app_blocker_thing/home_screen.dart';
import 'package:app_blocker_thing/permission-management/dialogues/notification_permission_dialogue.dart';
import 'package:app_blocker_thing/permission-management/dialogues/usage_stats_dialogue.dart';
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

  static Future<void> usageStatsPermissionRequest(BuildContext context) async {
    final usageStatsStatus = await appBlock.checkUsageStatsPermission();

    if (context.mounted) {
      if (usageStatsStatus == 'denied') {
        UsageStatsDialogue.show(context);
      }
    }
  }
}
