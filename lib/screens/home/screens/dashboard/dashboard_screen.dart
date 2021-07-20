import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/api_provider.dart';
import 'package:kweliscore/screens/home/home.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/global/global_loader.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future? _userDashboard;
  String? token;

  @override
  void initState() {
    token = context.read<ApiProvider>().token;
    _userDashboard = context.read<ApiProvider>().getDashboard(token!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => KeyboardUtil.hideKeyboard(context),
        child: SizedBox(
          width: double.infinity,
          child: FutureBuilder(
            future: _userDashboard,
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.none:
                  return Center(
                    child: GlobalInfoDialog(message: GLOBAL_ERROR),
                  );
                case ConnectionState.waiting:
                  return GlobalLoader();
                case ConnectionState.done:
                  if (!snapshot.hasData) {
                    return Center(
                      child: GlobalInfoDialog(message: GLOBAL_ERROR),
                    );
                  }
                  if (snapshot.data.runtimeType == ServerResponse) {
                    String message = snapshot.data.detail;
                    return Center(
                      child: GlobalInfoDialog(
                        message: '$message Please login again',
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: Provider<DashboardResponse>(
                      create: (context) => snapshot.data,
                      child: Consumer<ApiProvider>(
                        builder: (context, value, child) {
                          // Switch Case
                          switch (value.dash) {
                            case Dashboard.Stale:
                              return GlobalLoader();
                            case Dashboard.Swara:
                              return SwaraDash();
                            case Dashboard.Chui:
                              return ChuiDash();
                            case Dashboard.Simba:
                              return SimbaDash();
                          }
                        },
                      ),
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
