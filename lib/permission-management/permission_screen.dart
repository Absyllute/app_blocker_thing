// if you think my code looks weird, its because of the built in flutter code formatting that i tried fighting with

import 'package:app_blocker_thing/home/home_screen.dart';
import 'package:app_blocker_thing/main.dart';
import 'package:flutter/material.dart';

class PermissionScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<PermissionScreen> createState() => PermissionScreenState();
}

class PermissionScreenState extends State<PermissionScreen>
    with WidgetsBindingObserver {
  Future<bool> hasOverlayPermissions() async {
    final status = await appBlock.checkOverlayPermission();

    if (status == 'granted') {
      return true;
    }

    return false;
  }

  Future<bool> hasUsageStatsPermission() async {
    final status = await appBlock.checkUsageStatsPermission();

    if (status == 'granted') {
      return true;
    }

    return false;
  }

  Future<bool> allPermissionsGranted() async {
    final overlayStatus = await appBlock.checkOverlayPermission();
    final usageStatsStatus = await appBlock.checkUsageStatsPermission();

    if (overlayStatus == 'granted' && usageStatsStatus == 'granted') {
      return true;
    } else {
      return false;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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

                        FutureBuilder(
                          future: hasOverlayPermissions(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }

                            if (snapshot.hasData && snapshot.data == true) {
                              return Text(
                                'Granted',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: .bold,
                                ),
                              );
                            }

                            return Text(
                              'Denied',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: .bold,
                              ),
                            );
                          },
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

                        FutureBuilder(
                          future:
                              hasOverlayPermissions(), // I was fighting with my code formatter and lost
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox();
                            }

                            if (snapshot.hasData && snapshot.data == true) {
                              return SizedBox();
                            }

                            return ElevatedButton(
                              onPressed: () async {
                                await appBlock.requestOverlayPermission();
                              },
                              child: Text('Go To System Settings'),
                            );
                          },
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

                        FutureBuilder(
                          future: hasUsageStatsPermission(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }

                            if (snapshot.hasData && snapshot.data == true) {
                              return Text(
                                'Granted',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: .bold,
                                ),
                              );
                            }

                            return Text(
                              'Denied',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: .bold,
                              ),
                            );
                          },
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

                        FutureBuilder(
                          future: hasUsageStatsPermission(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox();
                            }

                            if (snapshot.hasData && snapshot.data == true) {
                              return SizedBox();
                            }

                            return ElevatedButton(
                              onPressed: () async {
                                await appBlock.requestUsageStatsPermission();
                              },
                              child: Text('Go To System Settings'),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Spacer(),

              FutureBuilder(
                future: allPermissionsGranted(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox();
                  }

                  if (snapshot.hasData && snapshot.data == true) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => appRestartNotifier.value++,
                        child: Text('Finish'),
                      ),
                    );
                  }

                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
