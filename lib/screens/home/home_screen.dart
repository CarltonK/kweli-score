import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  AuthProvider _authProvider;
  NotificationHelper _notificationHelper;

  @override
  void initState() {
    _notificationHelper = NotificationHelper.empty();
    _notificationHelper.notificationHandler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        _authProvider = value;
        return child;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'KWELI SCORE',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => _authProvider.signOut(),
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                height: 350,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: CustomFab(),
      ),
    );
  }
}
