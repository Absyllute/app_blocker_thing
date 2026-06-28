import 'package:app_blocker_thing/home_screen.dart';
import 'package:flutter/material.dart';

class NotificationPermissionDialogue {
  static void show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Notification Permissions Required'),

          content: Text(
            'In order to notify you to resume your session if you end sessions early, we need notification permissions',
          ),

          actions: [
            ElevatedButton(
              onPressed: () async {
                await appBlock.requestNotificationPermission();
                if (context.mounted) Navigator.pop(context);
              },
              child: Text('Grant Permission'),
            ),
          ],
        );
      },
    );
  }
}
