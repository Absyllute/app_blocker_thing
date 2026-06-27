import 'package:app_blocker_thing/info_dialogue.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
