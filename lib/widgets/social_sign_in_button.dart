import 'package:flutter/material.dart';

class SocialSignInButton extends StatelessWidget {
  final String path;

  SocialSignInButton({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image(
        image: AssetImage(path),
        fit: BoxFit.contain,
      ),
    );
  }
}
