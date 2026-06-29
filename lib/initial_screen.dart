// initial screen determines the initial state of the app (go to home screen or go to permission request screen)

import 'package:app_blocker_thing/home/home_screen.dart';
import 'package:app_blocker_thing/permission-management/permission_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Future<bool> hasAllPermissions() async {
    final usageStatsStatus = await appBlock.checkUsageStatsPermission();
    final overlayStatus = await appBlock.checkOverlayPermission();

    if (overlayStatus == 'granted' && usageStatsStatus == 'granted') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: hasAllPermissions(),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (snapshot.hasData && snapshot.data == true) {
          return HomeScreen();
        }

        return PermissionScreen();
      },
    );
  }
}
