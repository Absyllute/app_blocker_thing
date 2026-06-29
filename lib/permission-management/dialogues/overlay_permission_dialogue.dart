import 'package:app_blocker_thing/home_screen.dart';
import 'package:flutter/material.dart';

class OverlayPermissionDialogue {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Overlay Permission Required'),
          content: Text(
            'In order for an overlay to be displayed, we need the "appear over other apps" permission.',
          ),
          actions: [
            ElevatedButton(
              child: Text('Go To System Settings'),
              onPressed: () {
                appBlock.requestOverlayPermission();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
