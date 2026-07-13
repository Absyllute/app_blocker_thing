import 'dart:typed_data';

import 'package:app_blocker_thing/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppTile extends StatefulWidget {
  final Map<String, dynamic> app;
  final bool isInitialyBlocked;
  final Function onTapped;

  const new({
    super.key,
    required this.app,
    required this.isInitialyBlocked,
    required this.onTapped,
  });

  @override
  State<AppTile> createState() => _AppTileState();
}

class _AppTileState extends State<AppTile> {
  late Future<Uint8List?> _appIconFuture;

  Future<Uint8List?> appIcon(String packageName) async {
    final icon = await appBlock.getAppIcon(widget.app['packageName']);
    return icon;
  }

  @override
  void initState() {
    super.initState();
    _appIconFuture = appIcon(widget.app['packageName']);
  }

  @override
  void didUpdateWidget(covariant AppTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.app['packageName'] != widget.app['packageName']) {
      _appIconFuture = appIcon(widget.app['packageName']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .fromLTRB(6, 2, 6, 2),
      child: GestureDetector(
        onTap: () => widget.onTapped(),
        child: Container(
          padding: .all(12),
          decoration: BoxDecoration(
            borderRadius: .circular(12),

            color: Color.fromARGB(255, 47, 47, 47),
          ),
          child: Row(
            children: [
              FutureBuilder(
                future: _appIconFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == .waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasData && snapshot.data != null) {
                    return Row(
                      children: [
                        Image.memory(snapshot.data!, width: 48, height: 48),
                        SizedBox(width: 6),
                      ],
                    );
                  }

                  return Row(
                    children: [
                      Icon(Icons.android, size: 48),
                      SizedBox(width: 6),
                    ],
                  );
                },
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      widget.app['appName'],
                      style: TextStyle(fontSize: 18, fontWeight: .bold),
                      overflow: .ellipsis,
                      maxLines: 1,
                    ),

                    Text(
                      widget.app['packageName'],
                      overflow: .ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),

              Switch(
                value: widget.isInitialyBlocked,
                onChanged: (value) {
                  widget.onTapped();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
