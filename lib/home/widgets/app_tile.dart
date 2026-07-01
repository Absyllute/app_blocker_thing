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
  late bool _isBlocked;

  @override
  void initState() {
    super.initState();
    _isBlocked = widget.isInitialyBlocked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .fromLTRB(6, 2, 6, 2),
      child: Container(
        padding: .all(12),
        decoration: BoxDecoration(
          borderRadius: .circular(12),

          color: Colors.grey[800],
        ),
        child: Row(
          children: [
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
              value: _isBlocked,
              onChanged: (value) {
                setState(() {
                  _isBlocked = value;
                });
                widget.onTapped();
              },
            ),
          ],
        ),
      ),
    );
  }
}
