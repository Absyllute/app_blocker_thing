import 'package:flutter/material.dart';
import 'package:zo_app_blocker/zo_app_blocker.dart';

@pragma('vm:entry-point')
void onBlockScreenRequested() {
  ZoBlockScreenRunner.run(
    builder: (context) {
      return Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (context.appIcon != null)
                Image.memory(context.appIcon!, width: 100, height: 100),
              const SizedBox(height: 24),
              Text(
                '${context.appName ?? 'App'} is Blocked!',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),

              Text(
                'This app is blocked and is not allowed for use',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 24),
              // Dismiss button
              ElevatedButton(
                onPressed: context.onDismiss,
                child: const Text('Exit'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
