import 'package:app_blocker_thing/home_screen.dart';
import 'package:flutter/material.dart';

class UsageStatsDialogue {
  static void show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Usage Stats Permission Required.'),

        content: Text(
          'In order to detect when the blocked app is opened, we need Usage Stats '
          "Permission. We'll redirect you to your System Settings to grant these permissions.",
        ),

        actions: [
          ElevatedButton(
            onPressed: () async {
              await appBlock.requestUsageStatsPermission();

              if (context.mounted) Navigator.of(context).pop();
            },
            child: Text('Go to System Settings'),
          ),
        ],
      ),
    );
  }
}
