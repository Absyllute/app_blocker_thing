import 'package:flutter/material.dart';

class InfoDialogue {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('App Info', textAlign: .center),
        content: Column(
          mainAxisSize: .min,
          children: [
            Text('Did you know that App Blocking with Flutter \n'),
            Text(
              'IS HORRIBLE?!?!? \n',
              style: TextStyle(fontWeight: .bold, fontSize: 24),
            ),

            Text(
              textAlign: .center,
              "Is it unreasonable to look for ONE SINGLE app blocking dependency that has decent permission management / setup "
              "and doesn't have an easy way to just get around app blocking??? \n",
            ),

            Text(
              'OF COURSE NOT??? \n',
              style: TextStyle(fontWeight: .bold, fontSize: 24),
            ),

            Text(
              'So tell me why i had to go through 3 diferent packages until i found this one???? \n',
            ),

            Text(
              'First, it was app_block, then it was app_blocker (2 different things btw) and now im on zo_app_blocker :sob:',
            ),
          ],
        ),

        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Pay Respects to Absyllute 🫡'),
          ),
        ],
      ),
    );
  }
}
