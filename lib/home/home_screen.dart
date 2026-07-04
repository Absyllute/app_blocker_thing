import 'package:app_blocker_thing/home/loading_screen.dart';
import 'package:app_blocker_thing/home/widgets/app_tile.dart';
import 'package:app_blocker_thing/home/widgets/info_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:zo_app_blocker/zo_app_blocker.dart';

final appBlock = ZoAppBlocker.instance;

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<String> _selectedApps = {};
  bool isLoading = true;
  String? errorMessage;

  List<Map<String, dynamic>> _allApps = [];

  Future<void> loadApps() async {
    try {
      final apps = await appBlock.getApps();

      setState(() {
        _allApps = apps;
        isLoading = false;
      });
    } catch (catchError) {
      errorMessage = catchError.toString();
      isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    loadApps();
  }

  Future<List<Map<String, dynamic>>> installedAppsFuture() async {
    Future.delayed(Duration(seconds: 3));
    return await appBlock.getApps();
  }

  void _toggleApp(String packageName) {
    if (_selectedApps.contains(packageName)) {
      _selectedApps.remove(packageName);
    } else {
      _selectedApps.add(packageName);
    }
  }

  Future<void> applyBlocklist() async {
    if (_selectedApps.isEmpty) {
      await appBlock.unblockAll();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Unblocked all apps',
              style: TextStyle(color: Colors.white),
              textAlign: .center,
            ),
            backgroundColor: Colors.grey[900],
          ),
        );
      }
      return;
    }

    await appBlock.blockApps(_selectedApps.toList());

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Blocked ${_selectedApps.length} apps!',
            style: TextStyle(color: Colors.white),
            textAlign: .center,
          ),
          backgroundColor: Colors.grey[900],
        ),
      );
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_allApps.isNotEmpty) {
      body = ListView.builder(
        itemCount: _allApps.length,
        itemBuilder: (context, index) {
          final app = _allApps[index];
          final String packageName = app['packageName'] ?? '';
          bool isBlocked = _selectedApps.contains(packageName);

          return AppTile(
            app: app,
            isInitialyBlocked: isBlocked,
            onTapped: () => _toggleApp(packageName),
          );
        },
      );
    } else if (isLoading) {
      body = const LoadingScreen();
    } else if (errorMessage != null) {
      body = Center(child: Text('Error: $errorMessage'));
    } else {
      body = const Center(child: Text('Error: Apps Not Found'));
    }

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
      body: body,
      bottomNavigationBar: Padding(
        padding: .all(12.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => applyBlocklist(),
            child: Text('Block / Unblock Apps'),
          ),
        ),
      ),
    );
  }
}
