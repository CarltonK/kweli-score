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
  // ApiProvider? _authProvider;
  NotificationHelper? _notificationHelper;

  void popDialog() {
    Navigator.of(context).pop();
  }

  Future<dynamic> _onMessage(Map<String, dynamic> message) async {
    // print('onMessage received: $message');
  }

  @override
  void initState() {
    _notificationHelper = NotificationHelper.empty();
    _notificationHelper!.notificationHandler(_onMessage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KWELI SCORE',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<ApiProvider>().status = Status.Unauthenticated;
            },
          )
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
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
              const SizedBox(height: 20),
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
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.autorenew), onPressed: () {}),
          label: 'Refresh',
        ),
        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.business), onPressed: () {}),
          label: 'Details',
        ),
        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.message), onPressed: () {}),
          label: 'Contact Us',
        )
      ]),
      floatingActionButton: CustomFab(),
    );
  }
}
