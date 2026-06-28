import 'package:app_blocker_thing/info_dialogue.dart';
import 'package:app_blocker_thing/permission-management/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:zo_app_blocker/zo_app_blocker.dart';

final appBlock = ZoAppBlocker.instance;

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Blocker Thing'),
        actions: [
          IconButton(
            onPressed: () {
              InfoDialogue.show(context);
            },
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  PermissionHandler.notificationPermissionRequest(context),
              child: Text('Check Notification Permission'),
            ),
          ],
        ),
      ),
    );
  }
}
