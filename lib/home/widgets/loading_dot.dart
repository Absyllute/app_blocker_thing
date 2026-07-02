import 'package:flutter/material.dart';

class LoadingDot extends StatefulWidget {
  const new({super.key});

  @override
  State<LoadingDot> createState() => _LoadingDotState();
}

class _LoadingDotState extends State<LoadingDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        shape: .circle,
      ),

      width: 12,
      height: 12,
    );
  }
}
