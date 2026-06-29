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
      body: Center(child: Text('Permission Screen Content')),
    );
  }
}
