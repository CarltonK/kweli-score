import 'package:flutter/material.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  _exitApp(BuildContext context) {
    context.read<ApiProvider>().status = Status.Unauthenticated;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => KeyboardUtil.hideKeyboard(context),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                SizedBox(height: DeviceConfig.screenHeight! * 0.04),
                ProfilePic(),
                SizedBox(height: DeviceConfig.screenHeight! * 0.04),
                GlobalMenuItem(
                  text: 'My Account',
                  icon: Icons.person,
                  press: () => dialogComingSoon(context),
                ),
                GlobalMenuItem(
                  text: 'Settings',
                  icon: Icons.settings,
                  press: () => dialogComingSoon(context),
                ),
                GlobalMenuItem(
                  text: 'Legal',
                  icon: Icons.gavel,
                  press: () => dialogComingSoon(context),
                ),
                GlobalMenuItem(
                  text: 'Log Out',
                  icon: Icons.exit_to_app,
                  press: () => dialogExitApp(context, () => _exitApp(context)),
                ),
                SizedBox(height: DeviceConfig.screenHeight! * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
