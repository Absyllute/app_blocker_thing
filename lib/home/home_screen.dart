import 'package:app_blocker_thing/home/info_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:zo_app_blocker/zo_app_blocker.dart';

final appBlock = ZoAppBlocker.instance;

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          children: [Text('You\'re supposed to pick an app to block here.')],
        ),
      ),
    );
  }
}
