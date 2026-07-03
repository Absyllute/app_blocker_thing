// This took me 3+ hours to animate ts 😭😭😭

import 'dart:math' as math;

import 'package:app_blocker_thing/home/widgets/loading_dot.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..reverse()
          ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Grade 9 math did *NOT* prepare me for ts 🥀
  double _getWaveY(double delay) {
    double angle = (_animationController.value + delay) * 2 * math.pi;

    return ((math.sin(angle) - 1) / 2) * 12;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Row(
              spacing: 6,
              mainAxisSize: .min,
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, _) {
                    return Transform.translate(
                      offset: Offset(0, _getWaveY(0.75)),
                      child: LoadingDot(),
                    );
                  },
                ),

                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, _) {
                    return Transform.translate(
                      offset: Offset(0, _getWaveY(0.5)),
                      child: LoadingDot(),
                    );
                  },
                ),

                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, _) {
                    return Transform.translate(
                      offset: Offset(0, _getWaveY(0.25)),
                      child: LoadingDot(),
                    );
                  },
                ),

                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, _) {
                    return Transform.translate(
                      offset: Offset(0, _getWaveY(0)),
                      child: LoadingDot(),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 12),
            Text('Finding your apps...'),
          ],
        ),
      ),
    );
  }
}
