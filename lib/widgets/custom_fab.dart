import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:kweliscore/utilities/utilities.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FloatingActionButton(
      backgroundColor: Palette.ksmartPrimary,
      onPressed: () {},
      child: FocusedMenuHolder(
        blurSize: 5.0,
        menuBoxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        menuWidth: size.width * 0.50,
        menuItemExtent: 45,
        animateMenuItems: true,
        blurBackgroundColor: Colors.black54,
        openWithTap: true,
        menuOffset: 10.0,
        bottomOffsetHeight: 80.0,
        menuItems: [
          FocusedMenuItem(
            title: Text(
              'Contact Us',
            ),
            onPressed: () {},
            trailingIcon: Icon(Icons.message),
          ),
          FocusedMenuItem(
            title: Text('Email report'),
            onPressed: () {},
            trailingIcon: Icon(Icons.arrow_upward),
          ),
        ],
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
