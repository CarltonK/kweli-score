import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.hardEdge,
        children: [
          ProfileAvatar(),
          Positioned(
            bottom: 0,
            right: -12,
            child: SizedBox(
              height: 45,
              width: 45,
              child: FlatButton(
                padding: EdgeInsets.zero,
                color: Palette.backgroundWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: () => print('I want to upload a picture'),
                child: Icon(Icons.add_a_photo),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
