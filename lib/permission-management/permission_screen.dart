import 'package:app_blocker_thing/home/home_screen.dart';
import 'package:flutter/material.dart';

class PermissionScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<PermissionScreen> createState() => PermissionScreenState();
}

class PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Required Permissions')),
      body: Center(
        child: Padding(
          padding: .all(18),
          child: Column(
            spacing: 24,
            children: [
              //\\//\\//\\//\\//\\ -- Overlay Permission Container -- //\\//\\//\\//\\//\\
              Container(
                padding: .all(18),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: .circular(12),
                ),

                child: Column(
                  spacing: 12,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Overlay Permission:',
                          style: TextStyle(fontSize: 18, fontWeight: .bold),
                        ),

                        Spacer(),

                        Text(
                          'Denied',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      textAlign: .center,
                      'The "appear over other apps" allows the app to display a blocking overlay when the blocked app is opened.',
                    ),

                    Row(
                      children: [
                        Spacer(),

                        ElevatedButton(
                          onPressed: () async {
                            await appBlock.requestOverlayPermission();
                          },
                          child: Text('Go To System Settings'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //\\//\\//\\//\\//\\ -- Usage Stats Permission Container -- //\\//\\//\\//\\//\\
              Container(
                padding: .all(18),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: .circular(12),
                ),

                child: Column(
                  spacing: 12,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Usage Stats Permission:',
                          style: TextStyle(fontSize: 18, fontWeight: .bold),
                        ),

                        Spacer(),

                        Text(
                          'Granted',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      textAlign: .center,
                      'The "Usage Stats" permission allows the app to see what app is currently open.'
                      'In order to detect if the blocked app is opened, we need the usage stats permission',
                    ),

                    Row(
                      children: [
                        Spacer(),

                        ElevatedButton(
                          onPressed: () async {
                            await appBlock.requestOverlayPermission();
                          },
                          child: Text('Go To System Settings'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
