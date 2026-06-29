import 'package:app_blocker_thing/home/home_screen.dart';
import 'package:app_blocker_thing/permission-management/dialogues/overlay_permission_dialogue.dart';
import 'package:app_blocker_thing/permission-management/dialogues/usage_stats_dialogue.dart';
import 'package:flutter/material.dart';

class PermissionHandler {
  static Future<void> requestPermissions() async {}

  //\\//\\//\\//\\//\\ -- Temporary for testing -- //\\//\\//\\//\\//\\

  static Future<void> usageStatsPermissionRequest(BuildContext context) async {
    final usageStatsStatus = await appBlock.checkUsageStatsPermission();

    if (context.mounted) {
      if (usageStatsStatus == 'denied') {
        UsageStatsDialogue.show(context);
      }
    }
  }

  static Future<void> overlayPermissionRequest(BuildContext context) async {
    final overlayStatus = await appBlock.checkOverlayPermission();

    if (context.mounted) {
      if (overlayStatus == 'denied') {
        OverlayPermissionDialogue.show(context);
      }
    }
  }
}
