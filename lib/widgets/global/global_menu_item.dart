import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class GlobalMenuItem extends StatelessWidget {
  const GlobalMenuItem({
    Key? key,
    required this.text,
    this.subtext,
    required this.icon,
    this.press,
    this.isSubsetWidget = false,
  }) : super(key: key);

  final String? text;
  final String? subtext;
  final IconData icon;
  final VoidCallback? press;
  final bool isSubsetWidget;

  Widget _includeSubtext() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(subtext!, style: TextStyle(fontSize: 11)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isSubsetWidget
          ? const EdgeInsets.symmetric(vertical: 10, horizontal: 5)
          : const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: FlatButton(
        padding: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Palette.backgroundWhite,
        onPressed: press,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text!),
                  subtext != null ? _includeSubtext() : Container()
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
