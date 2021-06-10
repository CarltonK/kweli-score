import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:provider/provider.dart';

class PageIndicator extends StatelessWidget {
  _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.decelerate,
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.black : Colors.transparent,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<IndexNotifier>().index;

    List<Widget> _buildIndicator() {
      List<Widget> indicators = [];

      for (int i = 0; i < intros.length; i++) {
        indicators.add(
          i == currentIndex ? _indicator(true) : _indicator(false),
        );
      }
      return indicators;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Row(
        children: _buildIndicator(),
      ),
    );
  }
}
