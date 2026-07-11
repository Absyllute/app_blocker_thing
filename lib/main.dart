import 'package:app_blocker_thing/initial_screen.dart';
import 'package:flutter/material.dart';

final ValueNotifier<int> appRestartNotifier = ValueNotifier<int>(
  0,
); // when this value changes, that whole app restarts

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: .system,
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Colors.deepPurple,
          brightness: .light,
        ),

        snackBarTheme: SnackBarThemeData(
          backgroundColor: Color(0xFFFDF7FF),
          contentTextStyle: TextStyle(color: Colors.black),
        ),
      ),

      darkTheme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Colors.deepPurple,
          brightness: .dark, //
        ),

        snackBarTheme: SnackBarThemeData(
          backgroundColor: Color(0xFF141218),
          contentTextStyle: TextStyle(color: Colors.white),
        ),
      ),

      home: ValueListenableBuilder<int>(
        valueListenable: appRestartNotifier,
        builder: (context, value, child) {
          return InitialScreen(key: ValueKey(value));
        },
      ),
    );
  }
}
