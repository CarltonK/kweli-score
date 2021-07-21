import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/palette.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ApiProvider _apiProvider;
  late String token;
  Future? getUserFuture;

  int _index = 0;
  PageController? _controller;

  final List<Widget> _pages = [
    DashboardScreen(),
    PricingScreen(),
    ProfileScreen(),
  ];

  final List<IconData> _iconsList = [
    Icons.home,
    Icons.receipt_long,
    Icons.person,
  ];

  _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Container(),
      elevation: 0,
      actions: [
        GlobalCircleButton(
          color: Colors.black,
          icon: Icons.exit_to_app,
          tooltip: 'Exit',
          onPressed: () => dialogExitApp(context, _exitApp),
        ),
      ],
    );
  }

  _bottomBar() {
    return AnimatedBottomNavigationBar(
      icons: _iconsList,
      backgroundColor: Palette.ksmartPrimary,
      activeColor: Colors.white,
      inactiveColor: Colors.black54,
      activeIndex: _index,
      onTap: _pageSwitcher,
      notchSmoothness: NotchSmoothness.smoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 0,
      gapLocation: GapLocation.end,
      splashSpeedInMilliseconds: 200,
    );
  }

  _body() {
    return FutureBuilder(
      future: getUserFuture,
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return GlobalLoader();
          case ConnectionState.none:
            return Center(child: GlobalInfoDialog(message: 'There is no user'));
          case ConnectionState.done:
            if (snapshot.data.runtimeType == ServerResponse) {
              return Center(
                child: GlobalInfoDialog(message: '${snapshot.data.detail}'),
              );
            }
            // Provide a user
            return Provider<UserModel>(
              create: (context) => snapshot.data,
              child: PageView.builder(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _pages[_index];
                },
              ),
            );
        }
      },
    );
  }

  _pageSwitcher(int index) {
    setState(() => _index = index);
    _controller!.animateToPage(
      _index,
      duration: Constants.veryFluidDuration,
      curve: Curves.easeOutCubic,
    );
  }

  _exitApp() => _apiProvider.status = Status.Unauthenticated;

  _buildPopStack() {
    if (_index != 0) {
      _pageSwitcher(0);
    } else {
      return dialogExitApp(context, _exitApp);
    }
  }

  Future<bool> _onWillPop() {
    return _buildPopStack() ?? false;
  }

  @override
  void initState() {
    super.initState();

    _apiProvider = context.read<ApiProvider>();
    token = _apiProvider.token;
    getUserFuture = _apiProvider.getUser(token);
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: _appBar(),
        backgroundColor: Colors.white,
        body: _body(),
        bottomNavigationBar: _bottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: CustomFab(),
      ),
    );
  }
}
